// package hkmu.wadd.Controller;

// import hkmu.wadd.Model.UserRegistration;
// import jakarta.validation.Valid;
// import org.springframework.stereotype.Controller;
// import org.springframework.ui.Model;
// import org.springframework.validation.BindingResult;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.ModelAttribute;
// import org.springframework.web.bind.annotation.PostMapping;

// @Controller
// public class RegistrationController {
//     // private UserRepository userRepository;
//     // private PasswordEncoder passwordEncoder;

//     @GetMapping("/register")
//     public String showRegistrationForm(Model model) {
//         model.addAttribute("userRegistration", new UserRegistration());
//         return "register"; // This resolves to /WEB-INF/jsp/register.jsp
//     }

//     @PostMapping("/register")
//     public String registerUser(@Valid @ModelAttribute("userRegistration") UserRegistration userRegistration,
//                                BindingResult result) {
//         if (result.hasErrors()) {
//             return "register"; // Return to form if validation errors exist
//         }

//         // Uncomment this block to enable saving the user -- NOTE: CONNECTS TO DB
//         /*
//         User user = new User();
//         user.setUsername(userRegistration.getUsername());
//         user.setPassword(passwordEncoder.encode(userRegistration.getPassword()));
//         user.setFullName(userRegistration.getFullName());
//         user.setEmail(userRegistration.getEmail());
//         user.setPhone(userRegistration.getPhone());
//         user.setRole("ROLE_STUDENT"); // Set user role

//         userRepository.save(user); // Save user to the database
//         */

//         return "redirect:/login?registered=true"; // Redirect after successful registration
//     }
// }