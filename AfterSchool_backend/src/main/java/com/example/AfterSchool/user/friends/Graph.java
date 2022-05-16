package com.example.AfterSchool.user.friends;
import java.util.ArrayList;

public class Graph <T>{

    private ArrayList<T> friends;

    public Graph() {
        this.friends = new ArrayList<>();
    }

    public int getNumberOfFriends(){
        return friends.size();
    }


}
