package com.example.AfterSchool.services;
import com.example.AfterSchool.entities.userEntities.ConfimationToken;
import com.example.AfterSchool.entities.userEntities.User;
import com.example.AfterSchool.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.text.MessageFormat;
import java.util.List;
import java.util.Optional;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    UserRepository userRepository;
    public ConfirmationTokenService confirmationTokenService;

    public void signUpUser(User user){
        final String encryptedPassword = BCryptPasswordEncoder.encode(user.getPassword());
        user.setPassword(encryptedPassword);
        final User createdUSer = userRepository.save(user);
        final ConfimationToken confimationToken = new ConfimationToken(user);
        confirmationTokenService.saveConfirmationToken(confimationToken);
    }
    public void updateUser(User user){
        if(userRepository.existsById(user.getId()))
            userRepository.save(user);
    }


    public String addUser(User user){
        if(!userRepository.existsByUsername(user.getUsername())){
            userRepository.save(user);
            return "added successfully";
        } else {
            return "user already added";
        }
    }
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        final Optional<User> optionalUser = Optional.ofNullable(userRepository.findByUsername(username));
        if(optionalUser.isPresent()){
            return optionalUser.get();
        } else {
            throw new UsernameNotFoundException(MessageFormat.format("Användare med användarnamnet {0} hittades inte.", username));
        }
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
}
