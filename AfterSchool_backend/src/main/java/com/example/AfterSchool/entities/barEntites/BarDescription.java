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

    private String openingTime;
    private String description;

    public BarDescription(Bar bar, String openingTime) {
        this.reviews = new LinkedList<>();
        this.bar = bar;
        this.openingTime = openingTime;
    }

    public BarDescription() {

    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    public Bar getBar() {
        return bar;
    }

    public void setBar(Bar bar) {
        this.bar = bar;
    }

    public String getOpeningTime() {
        return openingTime;
    }

    public void setOpeningTime(String openingTime) {
        this.openingTime = openingTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
