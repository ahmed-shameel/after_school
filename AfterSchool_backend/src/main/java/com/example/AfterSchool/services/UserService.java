package com.example.AfterSchool.services;
import com.example.AfterSchool.entities.User;
import com.example.AfterSchool.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    public List<User> getAllUsers(){

        return userRepository.findAll();
    }

    public String addUser(User user){
        if(!userRepository.existsByEmail(user.getEmail())) {
            userRepository.save(user);
            return "Ditt konto är skapat";
        }else
            return "Du har redan ett konto, var vänlig logga in";
    }
}
