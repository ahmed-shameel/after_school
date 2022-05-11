package com.example.AfterSchool.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Profile {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @OneToOne
    private User user;
    private String info;

    public Profile(User user) {
        this.user = user;
    }

    public Profile() {

    }


    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Long getId() {
        return id;
    }
}
