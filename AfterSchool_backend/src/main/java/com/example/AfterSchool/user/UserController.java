package com.example.AfterSchool.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/signup")
    public User signUp(@RequestBody RegistrationRequest request){
        return userService.signUpUser(request);
    }

    @PostMapping("/login")
    public User login(@RequestBody User user){
        return userService.login(user.getEmail(), user.getPassword());
    }

    @GetMapping("/getuser")
    public User getByUsername(@RequestBody User user){
        return userService.getUserByUsername(user.getUsername());
    }

}
