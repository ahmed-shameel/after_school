package com.example.AfterSchool.entities.barEntites;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class BarItem {
    @Id
    @Column(name = "name", nullable = false)
    private String name;

    private String placeId;
    private String university;
    private String campus;
    private String adress;
    private String openingHours;
    private String requirement;

    public BarItem(String name, String campus, String adress, String openingHours, String university, String requirement){
        this.name = name;
        this.campus = campus;
        this.adress = adress;
        this.openingHours = openingHours;
        this.university = university;
        this.requirement = requirement;
    }

    public BarItem() {
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCampus(String campus) {
        this.campus = campus;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    public void setOpeningHours(String openingHours) {
        this.openingHours = openingHours;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public void setPlaceId(String placeId) {
        this.placeId = placeId;
    }



    public String getName() {
        return name;
    }

    public String getCampus() {
        return campus;
    }

    public String getAdress() {
        return adress;
    }

    public String getOpeningHours() {
        return openingHours;
    }

    public String getUniversity() {
        return university;
    }

    public String getRequirement() {
        return requirement;
    }

    public String getPlaceId() {
        return placeId;
    }

}
