package hkmu.wadd.Controller;

import hkmu.wadd.dao.LectureCommentsService;
import hkmu.wadd.dao.PollService;
import hkmu.wadd.exception.LectureNotFound;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/comments")
public class CommentsController {
    @Resource
    private LectureCommentsService lectureCommentsService;
    @Autowired
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
}
