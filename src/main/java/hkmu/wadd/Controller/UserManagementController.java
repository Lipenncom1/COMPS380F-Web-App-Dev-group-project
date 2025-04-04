package hkmu.wadd.Controller;

import hkmu.wadd.dao.UserManagementService;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@Controller
@RequestMapping("/user")
public class UserManagementController {
    @Resource
    UserManagementService umService;
    @GetMapping({"", "/", "/listUser"})
    public String list(ModelMap model) {
        model.addAttribute("IndexUser", umService.getAllIndexUser());
        return "listUser";
    }
    public static class Form {
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
            this.password = password;
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
    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("addUser", "IndexUser", new Form());
    }
    @PostMapping("/create")
    public String create(Form form) throws IOException {
        umService.createIndexUser(form.getUsername(),
                form.getPassword(), form.getRoles());
        return "redirect:/user/listUser";
        //return "redirect:/user/listUser";
    }
    @GetMapping("/delete/{username}")
    public String deleteUser(@PathVariable("username") String username) {
        umService.delete(username);
        return "redirect:/user/listUser";
    }
    @GetMapping("/register")
    public ModelAndView showRegistrationForm() {
        return new ModelAndView("register", "registrationForm", new Form());
    }
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("registrationForm") Form form) throws IOException {
        umService.registerIndexUser(
                form.getUsername(), form.getPassword(),
                form.getFullName(), form.getEmail(),
                form.getPhone(), form.getRoles()
        );
        return "redirect:/login?registered=true";
    }
}