package com.example.AfterSchool.services;
import com.example.AfterSchool.entities.userEntities.ConfirmationToken;
import com.example.AfterSchool.entities.userEntities.User;
import com.example.AfterSchool.repositories.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.text.MessageFormat;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class UserService implements UserDetailsService {

    private final UserRepository userRepository;
    private final ConfirmationTokenService confirmationTokenService;
    private final EmailSenderService emailSenderService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

        final Optional<User> optionalUser = Optional.ofNullable(userRepository.findByUsername(email));

        if(optionalUser.isPresent()){
            return optionalUser.get();
        } else {
            throw new UsernameNotFoundException(MessageFormat.format("Användare med epost {0} hittades inte.", email));
        }
    }

    public void signUpUser(User user){

        final String encryptedPassword = bCryptPasswordEncoder.encode(user.getPassword());

        user.setPassword(encryptedPassword);

        final User createdUSer = userRepository.save(user);

        final ConfirmationToken confirmationToken = new ConfirmationToken(user);

        confirmationTokenService.saveConfirmationToken(confirmationToken);
    }

    public void confirmUser(ConfirmationToken confirmationToken) {

        final User user = confirmationToken.getUser();

        user.setEnabled(true);

        userRepository.save(user);

        confirmationTokenService.deleteConfirmationToken(confirmationToken.getId());

    }

    public void sendConfirmationMail(String userMail, String token) {

        final SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(userMail);
        mailMessage.setSubject("Mail Confirmation Link!");
        mailMessage.setFrom("<MAIL>");
        mailMessage.setText(
                "Thank you for registering. Please click on the below link to activate your account." + "http://localhost:8080/sign-up/confirm?token="
                        + token);

        emailSenderService.sendEmail(mailMessage);
    }

    public void updateUser(User user){
        if(userRepository.existsById(user.getId()))
            userRepository.save(user);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
}
