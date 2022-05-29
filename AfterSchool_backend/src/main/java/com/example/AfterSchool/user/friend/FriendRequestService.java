package com.example.AfterSchool.user.friend;

import com.example.AfterSchool.user.User;
import com.example.AfterSchool.user.UserService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.example.AfterSchool.user.friend.RequestType.RECEIVED;
import static com.example.AfterSchool.user.friend.RequestType.SENT;

@Service
@AllArgsConstructor
public class FriendRequestService {

    private final FriendRequestRepository friendRequestRepository;
    private final UserService userService;

    public List<FriendRequest> getRequests(String username, RequestType type){
        User user = userService.getUserByUsername(username);
        if(type == SENT){
            return friendRequestRepository.getByFromAndRequestType(user, type);
        }
        return friendRequestRepository.getByToAndRequestType(user, type);

    }

    public String makeRequest(String from, String to){

        User fromUser = userService.getUserByUsername(from);
        User userTo = userService.getUserByUsername(to);

        FriendRequest sentRequest = new FriendRequest(fromUser, userTo, SENT);
        FriendRequest receivedRequest = new FriendRequest(fromUser, userTo, RECEIVED);
        friendRequestRepository.save(sentRequest);
        friendRequestRepository.save(receivedRequest);
        fromUser.addFriendRequest(sentRequest);
        userTo.addFriendRequest(receivedRequest);

        return "Request sent successfully";
    }

    public String acceptRequest(String from, String to){

        User fromUser = userService.getUserByUsername(from);
        User userTo = userService.getUserByUsername(to);

        FriendRequest friendRequest = friendRequestRepository.findFriendRequestsByFromAndToAndRequestType(fromUser, userTo, RECEIVED);
        friendRequest.acceptRequest();
        friendRequest.getFrom().addFriend(friendRequest.getTo());
        friendRequest.getTo().addFriend(friendRequest.getFrom());
        return "Friend added successfully";
    }
}
