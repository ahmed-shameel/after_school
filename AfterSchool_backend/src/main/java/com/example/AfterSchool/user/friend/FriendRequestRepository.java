package com.example.AfterSchool.user.friend;

import com.example.AfterSchool.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FriendRequestRepository extends JpaRepository<FriendRequest, Long> {

    List<FriendRequest> getByFromAndRequestType(User from, RequestType typ);
    List<FriendRequest> getByToAndRequestType(User from, RequestType typ);
    FriendRequest findFriendRequestsByFromAndToAndRequestType(User from, User to, RequestType type);


}
