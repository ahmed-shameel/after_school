package com.example.AfterSchool;
import com.example.AfterSchool.entities.userEntities.ConfirmationToken;
import com.example.AfterSchool.entities.userEntities.User;
import com.example.AfterSchool.services.ConfirmationTokenService;
import com.example.AfterSchool.services.UserService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@CrossOrigin(origins = "*")
@AllArgsConstructor
public class UserController {


    private final UserService userService;

    private final ConfirmationTokenService confirmationTokenService;

    @GetMapping("/sign-in")
    public String signIn(){
        return "sign-in";
    }

    @GetMapping("/sign-up")
    public String signUp(){
        return "sign-up";
    }

    @PostMapping("/sign-up")
    public String signUp(User user) {

        userService.signUpUser(user);

        return "redirect:/sign-in";
    }

    @GetMapping("/confirm")
    String confirmMail(@RequestParam("token") String token) {

        Optional<ConfirmationToken> optionalConfirmationToken = confirmationTokenService.findConfirmationTokenByToken(token);

        optionalConfirmationToken.ifPresent(userService::confirmUser);

        return "/sign-in";
    }

    @RequestMapping(value = "getallusers", method = RequestMethod.GET)
    public List<User> getAllUsers(){
        return userService.getAllUsers();
    }

    @RequestMapping(value = "updateuser", method = RequestMethod.PUT)
    public void updateUser(@RequestBody User user){
        userService.updateUser(user);
    }

}
