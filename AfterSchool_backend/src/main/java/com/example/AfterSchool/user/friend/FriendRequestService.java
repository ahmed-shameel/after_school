package com.example.AfterSchool.user.friend;

import com.example.AfterSchool.user.User;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import static com.example.AfterSchool.user.friend.RequestType.RECEIVED;
import static com.example.AfterSchool.user.friend.RequestType.SENT;

@Service
@AllArgsConstructor
public class FriendRequestService {

    private final FriendRequestRepository friendRequestRepository;

    public String makeRequest(User from, User to){
        FriendRequest sentRequest = new FriendRequest(from, to, SENT);
        FriendRequest receivedRequest = new FriendRequest(from, to, RECEIVED);
        from.addFriendRequest(sentRequest);
        to.addFriendRequest(receivedRequest);
        return "Request sent successfully";
    }

    public String acceptRequest(User from, User to){
        FriendRequest friendRequest = friendRequestRepository.findFriendRequestsByFromAndToAndRequestType(from, to, RECEIVED);
        friendRequest.acceptRequest();
        friendRequest.getFrom().addFriend(friendRequest.getTo());
        friendRequest.getTo().addFriend(friendRequest.getFrom());
        return "Friend added successfully";
    }
}
