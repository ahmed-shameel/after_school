package com.example.AfterSchool;
import com.example.AfterSchool.entities.userEntities.User;
import com.example.AfterSchool.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "getallusers", method = RequestMethod.GET)
    public List<User> getAllUsers(){
        return userService.getAllUsers();
    }

    @RequestMapping(value = "adduser", method = RequestMethod.POST)
    public String addUser(@RequestBody User user){
        return userService.addUser(user);
    }

    @RequestMapping(value = "updateuser", method = RequestMethod.PUT)
    public void updateUser(@RequestBody User user){
        userService.updateUser(user);
    }
}
