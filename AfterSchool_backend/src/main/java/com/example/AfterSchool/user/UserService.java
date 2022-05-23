package com.example.AfterSchool.user;

import com.example.AfterSchool.user.User;
import com.example.AfterSchool.user.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@AllArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    public User getUserByUsername(String username){
        Optional<User> foundUser = userRepository.findByUsername(username);
        if(foundUser.isPresent()){
            return foundUser.get();
        } else {
            throw new IllegalStateException("user not found");
        }
    }

    public User getByEmail(String email){
        Optional<User> foundUser = userRepository.findByEmail(email);
        if(foundUser.isPresent()){
            return foundUser.get();
        } else {
            throw new IllegalStateException("user not found");
        }
    }

    public User login(String email, String password){
        Optional<User> foundUser = userRepository.findByEmailAndPassword(email, password);
        if(foundUser.isPresent())
            return foundUser.get();
        else
            throw new IllegalStateException("wrong email or password");
    }
}
