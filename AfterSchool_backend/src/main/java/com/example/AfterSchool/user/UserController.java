package com.example.AfterSchool.user;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
public class UserController {


    private UserRepository userRepository;

    @PostMapping("/login")
    public User login(@RequestBody User user){
        Optional<User> oldUser = userRepository.findByEmailAndPassword(user.getEmail(), user.getPassword());
        if(oldUser.isPresent()){
            return oldUser.get();
        } else {
            throw new IllegalStateException("Wrong email or password");
        }
    }

}
