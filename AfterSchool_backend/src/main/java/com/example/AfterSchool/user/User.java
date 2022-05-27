package com.example.AfterSchool.user;

import com.example.AfterSchool.bar.review.Review;
import com.example.AfterSchool.user.friend.FriendRequest;
import lombok.Getter;
import lombok.Setter;
import javax.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity(name = "User")
@Getter
@Setter
public class User {

    @SequenceGenerator(
            name = "user_sequence",
            sequenceName = "user_sequence",
            allocationSize = 1
    )
    @Id
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "user_sequence"
    )
    private Long id;
    @Column(unique = true)
    private String username;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String profile;

    @OneToMany
    private List<FriendRequest> friendRequests;
    @ManyToMany(fetch = FetchType.EAGER)
    private List<User> friends;
    @OneToMany
    private List<Review> reviews;


    public User(String firstName, String lastName, String username, String email, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
        this.password = password;
        friends = new ArrayList<>();
        friendRequests = new ArrayList<>();
    }

    public User() {

    }

    public void addFriend(User friend){
        if(!friends.contains(friend))
            friends.add(friend);
    }

    public void addReview(Review review){
        reviews.add(review);
    }

    public void addFriendRequest(FriendRequest request){
        friendRequests.add(request);
    }

    public String acceptRequest(FriendRequest request){
        request.acceptRequest();
        addFriend(request.getFrom());
        request.getFrom().addFriend(this);
        return "You are now friends";
    }

    @Override
    public String toString() {
        return "User{" +
                "user='" + username + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
