package com.example.AfterSchool.entities.barEntites;

import javax.persistence.*;
import java.util.LinkedList;
import java.util.List;


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

    public BarDescription(Bar bar, String adress, String openingTime) {
        this.adress = adress;
        this.reviews = new LinkedList<>();
        this.bar = bar;
        this.openingTime = openingTime;
    }

    public BarDescription() {

    }

    //getters
    public Bar getBar() {
        return bar;
    }

    public String getOpeningTime() {
        return openingTime;
    }

    public String getDescription() {
        return description;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public String getAdress() {
        return adress;
    }


    //setters
    public void setBar(Bar bar) {
        this.bar = bar;
    }

    public void setOpeningTime(String openingTime) {
        this.openingTime = openingTime;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setAdress(String adress) {
        this.adress = adress;
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
