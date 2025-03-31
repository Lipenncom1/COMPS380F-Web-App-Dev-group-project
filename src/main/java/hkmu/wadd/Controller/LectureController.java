package hkmu.wadd.Controller;


import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import hkmu.wadd.Model.Attachment;
import hkmu.wadd.Model.Lecture;
import hkmu.wadd.View.DownloadingView;
import hkmu.wadd.dao.LectureService;
import hkmu.wadd.exception.AttachmentNotFound;
import hkmu.wadd.exception.LectureNotFound;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/lecture")
public class LectureController {

    @Resource
    private LectureService lectureService;

    @GetMapping(value = {"", "/list"})
    public String list(ModelMap model) {
        model.addAttribute("lectureDatabase", lectureService.getLectures());
        return "list";
    }

    @GetMapping("/addLecture")
    public ModelAndView addLecture() {
        return new ModelAndView("addLecture", "lectureForm", new Form());
    }

    public static class Form {
        private String lectureTitle;
        private List<MultipartFile> attachments;

        public String getLectureTitle() {
            return lectureTitle;
        }
        public void setLectureTitle(String lectureTitle) {
            this.lectureTitle = lectureTitle;
        }
        public List<MultipartFile> getAttachments() {
            return attachments;
        }
        public void setAttachments(List<MultipartFile> attachments) {
            this.attachments = attachments;
        }

    }

    @PostMapping("/addLecture")
    public View addLecture(Form form, Principal principal) throws IOException {
        long lectureId = lectureService.addLecture(form.getLectureTitle(), form.getAttachments());
        return new RedirectView("/lecture/view/" + lectureId, true);
    }

    @GetMapping("/view/{lectureId}")
    public String view(@PathVariable("lectureId") long lectureId,
                       ModelMap model)
            throws LectureNotFound {
        Lecture lecture = lectureService.getLecture(lectureId);
        model.addAttribute("lectureId", lectureId);
        model.addAttribute("lecture", lecture);
        return "view";
    }
    @GetMapping("/{lectureId}/attachment/{attachment:.+}")
    public View download(@PathVariable("lectureId") long lectureId,
                         @PathVariable("attachment") UUID attachmentId)
            throws LectureNotFound, AttachmentNotFound {
        Attachment attachment = lectureService.getAttachment(lectureId, attachmentId);
        return new DownloadingView(attachment.getName(),
                attachment.getMimeContentType(), attachment.getContents());
    }

    @GetMapping("/delete/{lectureId}")
    public String deleteLecture(@PathVariable("lectureId") long lectureId)
            throws LectureNotFound {
        lectureService.delete(lectureId);
        return "redirect:/lecture/list";
    }

    @GetMapping("/{lectureId}/delete/{attachment:.+}")
    public String deleteAttachment(@PathVariable("lectureId") long lectureId,
                                   @PathVariable("attachment") UUID attachmentId)
            throws LectureNotFound, AttachmentNotFound {
        lectureService.deleteAttachment(lectureId, attachmentId);
        return "redirect:/lecture/view/" + lectureId;
    }
    //could raise error BEWARE
    @GetMapping("/editLecture/{lectureId}")
    public ModelAndView showEdit(@PathVariable("lectureId") long lectureId,
                                 Principal principal, HttpServletRequest request)
            throws LectureNotFound {
        Lecture lecture = lectureService.getLecture(lectureId);
        if (lecture == null
                || (!request.isUserInRole("ROLE_ADMIN"))) {
//                && !principal.getName().equals(lecture.getLectureTitle()
            return new ModelAndView(new RedirectView("/lecture/list", true));
        }
        ModelAndView modelAndView = new ModelAndView("editLecture");
        modelAndView.addObject("lecture", lecture);
        Form lectureForm = new Form();
        modelAndView.addObject("lectureForm", lectureForm);
        return modelAndView;
    }

    @PostMapping("/editLecture/{lectureId}")
    public String edit(@PathVariable("lectureId") long lectureId, Form form,
                       Principal principal, HttpServletRequest request)
            throws IOException, LectureNotFound {
        Lecture lecture = lectureService.getLecture(lectureId);
        if (lecture == null
                || (!request.isUserInRole("ROLE_ADMIN"))){
//                && !principal.getName().equals(lecture.getLectureTitle())
            return "redirect:/lecture/list";
        }
        lectureService.updateLecture(lectureId, lecture.getLectureTitle(), form.getAttachments());
        return "redirect:/lecture/view/" + lectureId;
    }



    @ExceptionHandler({LectureNotFound.class, AttachmentNotFound.class})
    public ModelAndView error(Exception e){
        return new ModelAndView("error", "message", e.getMessage());
    }

}