package hkmu.wadd.controller;

//import hkmu.wadd.dao.UserRepository;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

@Controller
public class RegistrationController {
//    private UserRepository userRepository;
    //private PasswordEncoder passwordEncoder;

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        return "register";
    }
//
//    @PostMapping("/register")
//    public String registerUser(@RequestParam String username, @RequestParam String password, @RequestParam String fullName, @RequestParam String email, @RequestParam String phone) {
//        if (userRepository.findByUsername(username) != null) {
//            return "redirect:/register?error=username_exists";
//        }
//
////        User user = new User();
////        user.setUsername(username);
////        //user.setPassword(passwordEncoder.encode(password));
////        user.setFullName(fullName);
////        user.setEmail(email);
////        user.setPhone(phone);
////        user.setRole("ROLE_STUDENT"); // Only students can register
////
////        userRepository.save(user);
////
////        return "redirect:/login?registered=true"; //successful registration - redirected to  login page
////    }
//        return;
//    }

}

