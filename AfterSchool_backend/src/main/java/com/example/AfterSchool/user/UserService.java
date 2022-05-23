package com.example.AfterSchool.user;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@AllArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    public User signUpUser(RegistrationRequest request){
        if(userRepository.findByEmail(request.getEmail()).isPresent())
            throw new IllegalStateException("There is already a user with this email");

        if(userRepository.findByUsername(request.getUsername()).isPresent())
            throw new IllegalStateException("username is taken");

        User user = new User(request.getFirstName(), request.getLastName(),
                request.getUsername(), request.getEmail(), request.getPassword());
        userRepository.save(user);

        return user;
    }

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

    public String addFriend(String username){
        Optional<User> user = userRepository.findByUsername(username);
       if(user.isEmpty())
           throw new IllegalStateException("User not found");
       User foundUser = user.get();
       //TODO: add friend to current user

        return "You are friends now!";
    }
}
