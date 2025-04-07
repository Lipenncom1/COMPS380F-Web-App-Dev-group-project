package hkmu.wadd.Controller;


import hkmu.wadd.Model.Attachment;
import hkmu.wadd.Model.Index;
import hkmu.wadd.Model.IndexUser;
import hkmu.wadd.View.DownloadingView;
import hkmu.wadd.dao.IndexService;
import hkmu.wadd.dao.IndexUserService;
import hkmu.wadd.exception.AttachmentNotFound;
import hkmu.wadd.exception.LectureNotFound;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/index")
public class IndexController {

    @Resource
    private IndexService indexService;
    @Autowired
    private IndexUserService indexUserService;

    @GetMapping(value = {"", "/index"})
//    public String list(ModelMap model, Principal principal) {
    public String list(ModelMap model) {

        model.addAttribute("lectureDatabase", indexService.getLectures());
//        model.addAttribute("username", principal.getName());
        return "index";
    }

    public static class updateForm {
        private String username;
        private String password;
        private String fullName;
        private String email;
        private String phone;
        private String[] roles;
        // getters and setters for all properties
        public String getUsername() {
            return username;
        }
        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            if (!password.startsWith("{noop}")) {
                this.password = "{noop}" + password;
            } else {
                this.password = password;
            }
        }

        public String[] getRoles() {
            return roles;
        }

        public void setRoles(String[] roles) {
            this.roles = roles;
        }

        public String getFullName() { return fullName; }

        public void setFullName(String fullName) { this.fullName = fullName; }

        public String getEmail() { return email; }

        public void setEmail(String email) { this.email = email; }

        public String getPhone() { return phone; }

        public void setPhone(String phone) { this.phone = phone; }
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
        long lectureId = indexService.addLecture(form.getLectureTitle(), form.getAttachments());
        return new RedirectView("/index/view/" + lectureId, true);
    }

    @GetMapping("/view/{lectureId}")
    public String view(@PathVariable("lectureId") long lectureId,
                       ModelMap model)
            throws LectureNotFound {
        Index lecture = indexService.getLecture(lectureId);
        model.addAttribute("lectureId", lectureId);
        model.addAttribute("lecture", lecture);
        return "view";
    }
    @GetMapping("/{lectureId}/attachment/{attachment:.+}")
    public View download(@PathVariable("lectureId") long lectureId,
                         @PathVariable("attachment") UUID attachmentId)
            throws LectureNotFound, AttachmentNotFound {
        Attachment attachment = indexService.getAttachment(lectureId, attachmentId);
        return new DownloadingView(attachment.getName(),
                attachment.getMimeContentType(), attachment.getContents());
    }

    @GetMapping("/delete/{lectureId}")
    public String deleteLecture(@PathVariable("lectureId") long lectureId)
            throws LectureNotFound {
        indexService.delete(lectureId);
        return "redirect:/index";
    }

    @GetMapping("/{lectureId}/delete/{attachment:.+}")
    public String deleteAttachment(@PathVariable("lectureId") long lectureId,
                                   @PathVariable("attachment") UUID attachmentId)
            throws LectureNotFound, AttachmentNotFound {
        indexService.deleteAttachment(lectureId, attachmentId);
        return "redirect:/index/view/" + lectureId;
    }

    @GetMapping("/editLecture/{lectureId}")
    public ModelAndView showEdit(@PathVariable("lectureId") long lectureId,
                                 Principal principal, HttpServletRequest request)
            throws LectureNotFound {
        Index lecture = indexService.getLecture(lectureId);
        if (lecture == null
                || (!request.isUserInRole("ROLE_ADMIN"))) {
//                && !principal.getName().equals(lecture.getLectureTitle()
            return new ModelAndView(new RedirectView("/index", true));
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
        Index lecture = indexService.getLecture(lectureId);
        if (lecture == null
                || (!request.isUserInRole("ROLE_ADMIN"))){
//                && !principal.getName().equals(lecture.getLectureTitle())
            return "redirect:/index";
        }
        indexService.updateLecture(lectureId, form.getLectureTitle(), form.getAttachments());
        return "redirect:/index/view/" + lectureId;
    }

    @GetMapping("/update/{username}")
    public ModelAndView showUpdateForm(@PathVariable("username") String username, Principal principal, HttpServletRequest request) {
        IndexUser user = indexService.findUserByUsername(username);
        ModelAndView modelAndView = new ModelAndView("updateUser");
        IndexController.updateForm updateform = new IndexController.updateForm();

        updateform.setUsername(username);
        updateform.setPassword(user.getPassword().replace("{noop}", ""));
        updateform.setFullName(user.getFullName());
        updateform.setEmail(user.getEmail());
        updateform.setPhone(user.getPhone());

        modelAndView.addObject("updateForm", user);
        return modelAndView;
    }

    @PostMapping("/update/{username}")
    public String updateUserProfile(@PathVariable("username") String username, @Valid @ModelAttribute("updateForm") IndexController.updateForm updateform, Principal principal) throws IOException {

        //Fetch the current user details
        IndexUser currentUser = indexService.findUserByUsername(username);

        //Apply conditional updates only if the fields are not empty
        String updatedPassword = updateform.getPassword().isEmpty() ? currentUser.getPassword() : updateform.getPassword();
        String updatedFullName = updateform.getFullName().isEmpty() ? currentUser.getFullName() : updateform.getFullName();
        String updatedEmail = updateform.getEmail().isEmpty() ? currentUser.getEmail() : updateform.getEmail();
        String updatedPhone = updateform.getPhone().isEmpty() ? currentUser.getPhone() : updateform.getPhone();

        //Pass the updated values to the service layer
        indexService.updateUserProfile(username, updatedPassword, updatedFullName, updatedEmail, updatedPhone);

        return "redirect:/index?updateSuccess=true";
    }

    @ExceptionHandler({LectureNotFound.class, AttachmentNotFound.class})
    public ModelAndView error(Exception e){
        return new ModelAndView("error", "message", e.getMessage());
    }

}