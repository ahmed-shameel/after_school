package com.example.AfterSchool.bar;

import com.example.AfterSchool.bar.review.Review;
import com.example.AfterSchool.user.User;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity
public class Bar {
    @Id
    @Column(name = "name", nullable = false)
    private String name;

    private boolean open;
    private String openingTime;
    private String description;
    private String coordinates;
    private double rating;
    private String adress;
    private String university;

    @OneToMany
    @JoinColumn()
    private List<Review> reviews;

    public Bar(String name) {
        this.name = name;
    }

    public Bar() {

    }

    public void addReview(Review review){
        reviews.add(review);
        //sets the new rating
        int totalRate = 0;
        int numOfRates = 0;
        for(Review rev: reviews){
            totalRate += rev.getRate();
            numOfRates ++;
        }
        rating = (double) Math.round((double)totalRate/numOfRates);
    }
}
