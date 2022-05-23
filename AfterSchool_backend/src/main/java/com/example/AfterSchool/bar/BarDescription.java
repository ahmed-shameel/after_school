package com.example.AfterSchool.bar;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
public class BarDescription {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue
    private Long id;

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
        this.openingTime = openingTime;
    }

    public BarDescription() {

    }


}
