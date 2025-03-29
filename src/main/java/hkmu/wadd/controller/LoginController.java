package hkmu.wadd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String loginPage() {
        return "login"; // 对应模板文件 login.html
    }

//    @GetMapping("/")
//    public String redirectToLogin() {
//        return "index";
//    }
//
//    @GetMapping("/login")
//    public String showLoginPage() {
//        return "login"; // Displays the login.jsp page
//    }
}
