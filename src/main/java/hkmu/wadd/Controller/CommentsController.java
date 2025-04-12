package hkmu.wadd.Controller;


import hkmu.wadd.Model.Index;
import hkmu.wadd.Model.LectureComments;
import hkmu.wadd.Model.Poll;
import hkmu.wadd.Model.PollComment;
import hkmu.wadd.dao.LectureCommentsService;
import hkmu.wadd.exception.LectureNotFound;
import hkmu.wadd.exception.PollNotFound;
import jakarta.annotation.Resource;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import hkmu.wadd.dao.PollService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/comments")
public class CommentsController {
    @Resource
    private LectureCommentsService lectureCommentsService;

    @Resource
    private PollService pollService;

    @PostMapping("/{lectureId}/add")
    public String addComment(@PathVariable long lectureId, @RequestParam String commentText,
                             Authentication authentication) throws LectureNotFound {
        lectureCommentsService.addComments(
                lectureId,
                authentication.getName(),
                commentText
        );
        return "redirect:/index/view/" + lectureId;
    }

    @PostMapping("/{lectureId}/delete/{commentId}")
    public String deleteComment(@PathVariable Long lectureId, @PathVariable Long commentId)
            throws LectureNotFound {
        System.out.println("2222222");
        lectureCommentsService.deleteComment(lectureId, commentId);
        return "redirect:/index/view/" + lectureId;
    }

    @GetMapping("/viewAllComments")
    public String viewAllComments(Model model) {
        // Fetch lecture comments and their corresponding lectures
        List<LectureComments> lectureComments = lectureCommentsService.getAllLectureComments();
        Map<Long, String> lectureTitles = new HashMap<>(); // Maps lecture ID to its title
        for (LectureComments comment : lectureComments) {
            Index lecture = comment.getLecture();
            lectureTitles.put(lecture.getId(), lecture.getLectureTitle());
        }

        // Fetch poll comments and their corresponding poll questions
        List<PollComment> pollComments = pollService.getAllPollComments();
        Map<Long, String> pollQuestions = new HashMap<>(); // Maps poll ID to its question
        for (PollComment comment : pollComments) {
            Poll poll = null;
            try {
                poll = pollService.getPoll(comment.getPollId());
            } catch (PollNotFound e) {
                throw new RuntimeException(e);
            }
            pollQuestions.put(poll.getId(), poll.getQuestion());
        }

        // Pass data to the model
        model.addAttribute("lectureComments", lectureComments);
        model.addAttribute("lectureTitles", lectureTitles);
        model.addAttribute("pollComments", pollComments);
        model.addAttribute("pollQuestions", pollQuestions);

        return "viewAllComments"; // Refers to the JSP view file
    }



}
