package com.example.AfterSchool.entities.barEntites;

import com.example.AfterSchool.user.User;

import javax.persistence.*;

@Entity
public class Review {
    @Id
    @Column(name = "id", updatable = false)
    @GeneratedValue
    private Long id;

    @ManyToOne
    private User user;

    private double rate;
    private String comment;

    public Review(User user, double rate, String comment) {
        this.user = user;
        if(rate > 5.00 || rate < 0.00){
            throw new IllegalStateException("Rate most be from 1 - 5");
        } else {
            this.rate = rate;
        }
        this.comment = comment;
    }

    public Review() {

    }

    public Long getId(){
        return id;
    }

    public double getRate() {
        return rate;
    }

    public String getComment() {
        return comment;
    }

    public User getUser() {
        return user;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setRate(double rate) {
        if(rate > 5.00 || rate < 0.00){
            throw new IllegalStateException("Rate most be from 1 - 5");
        } else {
            this.rate = rate;
        }
    }

}
