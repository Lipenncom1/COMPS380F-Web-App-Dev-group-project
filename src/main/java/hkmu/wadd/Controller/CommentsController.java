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
