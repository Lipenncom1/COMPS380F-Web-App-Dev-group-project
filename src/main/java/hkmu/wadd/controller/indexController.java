package hkmu.wadd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class indexController {
    @GetMapping("/index")
    public String indexPage() {
        return "index"; // 对应模板文件 login.html
    }

    @GetMapping("/")
    public String indexHome() {
        return "index"; // 对应模板文件 login.html
    }

}


