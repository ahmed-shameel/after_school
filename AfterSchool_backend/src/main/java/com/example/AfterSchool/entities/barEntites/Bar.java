package com.example.AfterSchool.entities.barEntites;
import com.example.AfterSchool.entities.Event;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Bar {
    //implement egen id
    @Id
    @Column(name = "name", nullable = false)
    private String name;

    @OneToOne
    @JoinColumn(name = "description_ID")
    private BarDescription description;

    @OneToMany
    private List<Event> events;

    private boolean open;
    private double rating;

    public Bar(String name) {
        this.name = name;
        this.events = new ArrayList<>();
    }

    public Bar() {

    }

    public BarDescription getDescription() {
        return description;
    }

    public void setDescription(BarDescription description) {
        this.description = description;
    }

    public boolean isOpen() {
        return open;
    }

    public void setOpen(boolean open) {
        this.open = open;
    }

    public double getRatings() {
        return rating;
    }

    public void setRatings() {
        int numOfRev = 0;
        double totalRev = 0;
        for(Review rev: description.getReviews()){
            numOfRev += 1;
            totalRev += rev.getRate();
        }
        rating = totalRev/numOfRev;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Event> getEvents() {
        return events;
    }

    public void addEvent(Event event) {
        events.add(event);
    }


}
