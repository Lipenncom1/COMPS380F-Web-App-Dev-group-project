package hkmu.wadd.controller;
//
////import hkmu.wadd.dao.UserRepository;
////import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.ui.Model;
//import org.springframework.stereotype.Controller;
////import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.web.bind.annotation.*;
//
//@Controller
//public class RegistrationController {
////    private UserRepository userRepository;
//    //private PasswordEncoder passwordEncoder;
//
//    @GetMapping("/register")
//    public String showRegistrationForm(Model model) {
//        return "register";
//    }
//
//
//}
import java.util.UUID;
import hkmu.wadd.model.UserInfo;
import hkmu.wadd.repository.UserRepository;
import hkmu.wadd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class RegistrationController {

    private final UserService userService;
    //private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    //public RegistrationController(UserRepository userRepository, PasswordEncoder passwordEncoder) {
    public RegistrationController(UserService userService, PasswordEncoder passwordEncoder) {
        //this.userRepository = userRepository;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/register")
    public String showRegistrationForm(@RequestParam(value = "error", required = false) String error, Model model) {
        if (error != null) {
            model.addAttribute("error", error);
        }
        return "register";
    }

//    @PostMapping("/register")
//    public String registerUser(
//            @RequestParam String username,
//            @RequestParam String password,
//            @RequestParam(required = false) String fullName,
//            @RequestParam(required = false) String email,
//            @RequestParam(required = false) String phoneNum) {
//
//        // Check if username already exists
//        if (userRepository.findByUsername(username).isPresent()) {
//            return "redirect:/register?error=Username+already+exists";
//        }
//
//        // Create new user with STUDENT role
//        UserInfo newUser = new UserInfo();
//        newUser.setUsername(username);
//        newUser.setPassword(passwordEncoder.encode(password));
//        newUser.setFullName(fullName != null ? fullName : "FACKY CHAIN");
//        newUser.setEmail(email);
//        newUser.setPhoneNum(phoneNum);
//        newUser.setRole("STUDENT");
//
//        // Generate unique SID
//        String generatedSid = "a" + UUID.randomUUID().toString().replaceAll("[^0-9]", "").substring(0, 7);
//        newUser.setSid(generatedSid);
//
//        userRepository.save(newUser);
//
//        return "redirect:/login?registered";
//    }

    @PostMapping("/register")
    public String registerUser(
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam(required = false) String fullName,
            @RequestParam(required = false) String email,
            @RequestParam(required = false) String phoneNum
    ) {
        try {
            //判断是否已经注册
            if (userService.findUserByUsername(username) != null) {
                return "redirect:/register?error=Username+already+exists";
            }

            UserInfo newUser = new UserInfo();
            // 设置用户属性...
            userService.registerUser(newUser);
            return "redirect:/login?registered";
        } catch (Exception e) {
            return "redirect:/register?error=database_error";
        }
    }

}
