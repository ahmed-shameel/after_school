package com.example.AfterSchool.user.friends;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Graph <T>{

    private Map<T, ArrayList<T>> friends;

    public Graph() {
        this.friends = new HashMap<>();
    }


}
