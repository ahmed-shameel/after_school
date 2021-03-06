package com.example.AfterSchool.bar;

import com.example.AfterSchool.bar.review.Review;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@AllArgsConstructor
public class Bar {
    @Id
    @Column(name = "name", nullable = false)
    private String name;

    private boolean open;
    private String openingTime;
    private String description;
    private String facebookLink;
    private String instagramLink;
    private String requirements;
    private String coordinates;
    private double rating;
    private String adress;
    private String university;

    @OneToMany
    @JoinColumn()
    private List<Review> reviews = new ArrayList<>();

    public Bar() {
    }

    public Bar(String name) {
        this.name = name;
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
