package com.example.AfterSchool.entities.barEntites;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Review {
    @Id
    @Column(name = "id", updatable = false)
    @GeneratedValue
    private Long id;
    private double rate;
    private String comment;

    public Review(double rate, String comment) {
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

    public void setRate(double rate) {
        if(rate > 5.00 || rate < 0.00){
            throw new IllegalStateException("Rate most be from 1 - 5");
        } else {
            this.rate = rate;
        }
    }


    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

}
