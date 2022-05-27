package com.example.AfterSchool.user.friend;

import com.example.AfterSchool.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class FriendRequestController {

    @Autowired
    private FriendRequestService friendRequestService;

    @PostMapping("/send-friend-request")
    public String sendFriendRequest(@RequestBody User from, User to){
        return friendRequestService.makeRequest(from, to);
    }

    @PutMapping("/accept-friend-request")
    public String acceptFriend(@RequestBody User from, User to){
        return friendRequestService.acceptRequest(from, to);
    }

}
