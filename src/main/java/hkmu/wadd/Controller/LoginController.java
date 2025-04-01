package hkmu.wadd.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/")
    public String index() {
        return "redirect:/index";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }
}
