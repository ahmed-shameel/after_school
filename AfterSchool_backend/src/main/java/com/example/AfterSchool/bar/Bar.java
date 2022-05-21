package com.example.AfterSchool.bar;

import javax.persistence.*;


@Entity
public class Bar {
    //implement egen id
    @Id
    @Column(name = "name", nullable = false)
    private String name;
//
//    @OneToOne
//    @JoinColumn(name = "description_ID")
//    private BarDescription description;

    private boolean open;
    private double rating;

    public Bar(String name) {
        this.name = name;
    }

    public Bar() {

    }
//
//    public BarDescription getDescription() {
//        return description;
//    }
//
//    public void setDescription(BarDescription description) {
//        this.description = description;
//    }

    public boolean isOpen() {
        return open;
    }

    public void setOpen(boolean open) {
        this.open = open;
    }

    public double getRatings() {
        return rating;
    }

//    public void setRatings() {
//        int numOfRev = 0;
//        double totalRev = 0;
//        for(Review rev: description.getReviews()){
//            numOfRev += 1;
//            totalRev += rev.getRate();
//        }
//        rating = totalRev/numOfRev;
//    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
