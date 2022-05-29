package com.example.AfterSchool.user.friend;

import com.example.AfterSchool.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.example.AfterSchool.user.friend.RequestType.RECEIVED;
import static com.example.AfterSchool.user.friend.RequestType.SENT;


@RestController
public class FriendRequestController {

    @Autowired
    private FriendRequestService friendRequestService;

    @PostMapping("/send-friend-request")
    public String sendFriendRequest(@RequestBody RequestForm form){
        return friendRequestService.makeRequest(form.getFrom(), form.getTo());
    }

    @PutMapping("/accept-friend-request")
    public String acceptFriend(@RequestBody RequestForm requestForm){
        return friendRequestService.acceptRequest(requestForm.getFrom(), requestForm.getTo());
    }

    @GetMapping("/get-sent-requests")
    public List<FriendRequest> getSentRequests(@RequestBody User user){
        return friendRequestService.getRequests(user.getUsername(), SENT);
    }

    @GetMapping("/get-received-requests")
    public List<FriendRequest> getReceivedRequests(@RequestBody User user){
        return friendRequestService.getRequests(user.getUsername(), RECEIVED);
    }
}
