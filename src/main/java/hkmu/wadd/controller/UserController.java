package hkmu.wadd.controller;

import hkmu.wadd.model.UserInfo;
import hkmu.wadd.service.UserService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/register")
    public UserInfo register(@RequestBody UserInfo user) {
        return userService.registerUser(user);
    }

    @GetMapping("/{username}")
    public UserInfo getUserByUsername(@PathVariable String username) {
        return userService.findUserByUsername(username);
    }
}