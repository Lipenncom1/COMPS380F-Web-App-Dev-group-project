package hkmu.wadd.Controller;

import hkmu.wadd.Model.Poll;
import hkmu.wadd.Model.PollComment;
import hkmu.wadd.Model.UserVote;
import hkmu.wadd.dao.PollService;
import hkmu.wadd.exception.PollNotFound;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/index")
public class PollController {

    @Resource
    private PollService pollService;

    @GetMapping("/addPoll")
    public ModelAndView addPoll() {
        ModelAndView modelAndView = new ModelAndView("addPoll");
        modelAndView.addObject("pollForm", new PollForm());
        return modelAndView;
    }

    public static class PollForm {
        private String question;
        private String optionA;
        private String optionB;
        private String optionC;
        private String optionD;

        public String getQuestion() {
            return question;
        }

        public void setQuestion(String question) {
            this.question = question;
        }

        public String getOptionA() {
            return optionA;
        }

        public void setOptionA(String optionA) {
            this.optionA = optionA;
        }

        public String getOptionB() {
            return optionB;
        }

        public void setOptionB(String optionB) {
            this.optionB = optionB;
        }

        public String getOptionC() {
            return optionC;
        }

        public void setOptionC(String optionC) {
            this.optionC = optionC;
        }

        public String getOptionD() {
            return optionD;
        }

        public void setOptionD(String optionD) {
            this.optionD = optionD;
        }
    }

    @PostMapping("/addPoll")
    public View addPoll(PollForm form) {
        long pollId = pollService.addPoll(form.getQuestion(), form.getOptionA(),
                form.getOptionB(), form.getOptionC(), form.getOptionD());
        return new RedirectView("/index/viewPoll/" + pollId, true);
    }

    @GetMapping("/voteHistories")
    public String getAllVoteHistories(Model model) {
        List<Poll> polls = pollService.getPolls();
        Map<Long, List<UserVote>> votesByPoll = new HashMap<>();

        // Fetch votes for each poll
        for (Poll poll : polls) {
            List<UserVote> votes = pollService.getAllVotesByPollId(poll.getId());
            votesByPoll.put(poll.getId(), votes);
        }

        model.addAttribute("polls", polls);
        model.addAttribute("votesByPoll", votesByPoll);

        return "voteHistory"; // This links to the new JSP we'll create
    }


    @GetMapping("/viewPoll/{pollId}")
    public String viewPoll(@PathVariable("pollId") long pollId, Model model) throws PollNotFound {
        Poll poll = pollService.getPoll(pollId);
        List<PollComment> comments = pollService.getCommentsByPollId(pollId);

        model.addAttribute("poll", poll);
        model.addAttribute("pcomments", comments);

        return "viewPoll";
    }


    @PostMapping("/vote/{pollId}")
    public String vote(@PathVariable("pollId") long pollId,
                       @RequestParam(value = "option", required = false) String option,
                       HttpServletRequest request, Model model) throws PollNotFound {
//        if (!request.isUserInRole("ROLE_USER")) {
//            return "redirect:/login";
//        }

        if (option == null || option.isEmpty()) {
            model.addAttribute("errorMessage", "Please choose a choice");
//            return viewPoll(pollId, model);
            return "redirect:/index/viewPoll/" + pollId;

        }

        try {
            pollService.vote(pollId, option);
            return "redirect:/index/viewPoll/" + pollId;
        } catch (PollNotFound e) {
            return "error";
        }
    }

    @GetMapping("/editPoll/{pollId}")
    public ModelAndView editPoll(@PathVariable("pollId") long pollId,
                                 Principal principal, HttpServletRequest request) throws PollNotFound {
        Poll poll = pollService.getPoll(pollId);

        if (!request.isUserInRole("ROLE_ADMIN")) {
            return new ModelAndView(new RedirectView("/index", true));
        }

        ModelAndView modelAndView = new ModelAndView("editPoll");
        modelAndView.addObject("poll", poll);

        PollForm pollForm = new PollForm();
        pollForm.setQuestion(poll.getQuestion());
        pollForm.setOptionA(poll.getOptionA());
        pollForm.setOptionB(poll.getOptionB());
        pollForm.setOptionC(poll.getOptionC());
        pollForm.setOptionD(poll.getOptionD());

        modelAndView.addObject("pollForm", pollForm);
        return modelAndView;
    }

    @PostMapping("/editPoll/{pollId}")
    public String editPoll(@PathVariable("pollId") long pollId, PollForm form,
                           Principal principal, HttpServletRequest request) throws PollNotFound {
        if (!request.isUserInRole("ROLE_ADMIN")) {
            return "redirect:/index";
        }

        pollService.updatePoll(pollId, form.getQuestion(), form.getOptionA(),
                form.getOptionB(), form.getOptionC(), form.getOptionD());
        return "redirect:/index/viewPoll/" + pollId;
    }

    @GetMapping("/deletePoll/{pollId}")
    public String deletePoll(@PathVariable("pollId") long pollId,
                             Principal principal, HttpServletRequest request) throws PollNotFound {
        System.out.println("Attempting to delete poll with ID: " + pollId);
        System.out.println("User roles: " + request.getUserPrincipal().getName());
        if (!request.isUserInRole("ROLE_ADMIN")) {
            System.out.println("User is not admin, redirecting to index");
            return "redirect:/index";
        }

        pollService.delete(pollId);
        System.out.println("Poll deleted successfully");
        return "redirect:/index";
    }

    @PostMapping("/viewPoll/{pollId}/addComment")
    public String addComment(@PathVariable long pollId, @RequestParam String commentText,
                             Authentication authentication) throws PollNotFound {
        String username = authentication.getName(); // Ensure `username` isn't null
        pollService.addComment(pollId, username, commentText); // Add comment
        return "redirect:/index/viewPoll/" + pollId; // Redirect back to the poll view
    }


    @PostMapping("/viewPoll/{pollId}/deleteComment/{commentId}")
    public String deleteComment(@PathVariable long pollId, @PathVariable long commentId) {
        pollService.deleteComment(commentId);
        return "redirect:/index/viewPoll/" + pollId;
    }

    @ExceptionHandler({PollNotFound.class})
    public ModelAndView error(Exception e) {
        return new ModelAndView("error", "message", e.getMessage());
    }
}