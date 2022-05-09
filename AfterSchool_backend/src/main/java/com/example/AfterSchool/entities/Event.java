package com.example.AfterSchool.entities;
import com.example.AfterSchool.entities.barEntites.Bar;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import java.util.Date;

@Entity
public class Event {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;
    @OneToOne
    private Bar bar;
    private Date date;

    public Event(Bar bar, Date date) {
        this.bar = bar;
        this.date = date;
    }

    public Event() {

    }

    public Bar getBar() {
        return bar;
    }

    public Date getDate() {
        return date;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
