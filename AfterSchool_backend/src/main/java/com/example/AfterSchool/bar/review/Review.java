package com.example.AfterSchool.bar.review;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
public class Review {
    @Id
    @GeneratedValue
    private Long id;

    private String user;
    private String bar;
    private double rate;
    private String comment;

    public Review(String user, double rate, String comment, String bar) {
        this.user = user;
        this.bar = bar;
        if(rate > 5.00 || rate < 0.00){
            throw new IllegalStateException("Rate most be from 1 - 5");
        } else {
            this.rate = rate;
        }
        this.comment = comment;
    }

    public Review() {

    }

    public void setRate(double rate) {
        if(rate > 5.00 || rate < 0.00){
            throw new IllegalStateException("Rate most be from 1 - 5");
        } else {
            this.rate = rate;
        }
    }

}
