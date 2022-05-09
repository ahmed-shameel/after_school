package com.example.AfterSchool.entities;
import com.example.AfterSchool.entities.barEntites.Review;
import com.sun.istack.NotNull;
import javax.persistence.*;
import java.util.List;

import static javax.persistence.GenerationType.SEQUENCE;

@Entity(name = "User")
@Table(
        name = "user",
        uniqueConstraints = {
                @UniqueConstraint(name = "user_email_unique", columnNames = "email")
        }
)
public class User {

    @Id
    @SequenceGenerator(
            name = "user_sequence",
            sequenceName = "user_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = SEQUENCE,
            generator = "user_sequence"
    )
    @Column(updatable = false)
    private Long id;

    @Column(
            nullable = false,
            columnDefinition = "TEXT"
    )
    private String email;

    @Column(
            nullable = false,
            columnDefinition = "TEXT",
            unique = true
    )
    private String userName;

    private String firstName;
    private String lastName;

    @NotNull
    private String password;

    @OneToMany
    private List<Review> reviews;

    @ManyToMany
    private List<User> friends;

    //Constructors
    public User() {

    }
    public User(String email, String userName, String firstName, String lastName, String password) {
        this.email = email;
        this.userName = userName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
    }

    //Getters
    public String getEmail() {
        return email;
    }

    public String getUserName() {
        return userName;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPassword() {
        return password;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public List<User> getFriends(){
        return friends;
    }

    //Setters
    public void setEmail(String email) {
        this.email = email;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    //OtherMethods
    public void addReview(Review review) {
        reviews.add(review);
    }

    public void deleteReview(Review review){
        reviews.remove(review);
    }

    public void addFriend(User user){
        for(User friend: friends){
            if(user.equals(friend))
                return;
            friends.add(user);
            user.addFriend(this);
        }
    }

    @Override
    public String toString() {
        return "User{" +
                "email='" + email + '\'' +
                ", userName='" + userName + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", reviews=" + reviews +
                '}';
    }
}
