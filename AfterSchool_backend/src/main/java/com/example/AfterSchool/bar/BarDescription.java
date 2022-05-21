package com.example.AfterSchool.bar;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.LinkedList;
import java.util.List;

@Getter
@Setter
@Entity
public class BarDescription {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue
    private Long id;

    @OneToOne
    private Bar bar;

    @OneToMany
    private List<Review> reviews;
    private String adress;
    private String openingTime;
    private String description;
    private String coordinates;
    private String university;
    private String campus;
    private String requirements;
    private String facebookLink;

    public BarDescription(Bar bar, String adress, String openingTime) {
        this.adress = adress;
        this.reviews = new LinkedList<>();
        this.bar = bar;
        this.openingTime = openingTime;
    }

    public BarDescription() {

    }

    //Other methods
    public void addReview(Review review) {
        for(Review rev: reviews){
         if(rev.equals(review))
             return;
         reviews.add(review);
        }
    }

}
