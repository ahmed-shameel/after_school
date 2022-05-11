package com.example.AfterSchool;
import com.example.AfterSchool.user.UserService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


@CrossOrigin(origins = "*")
@AllArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping("/sign-in")
    public String signIn(){
        return "sign-in";
    }

    @GetMapping("/sign-up")
    public String signUp(){
        return "sign-up";
    }

}
