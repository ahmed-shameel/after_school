package com.example.AfterSchool.bar;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class BarService {

    private final BarRepository barRepository;

    public List<Bar> getAllBars(){
        return barRepository.findAll();
    }

    public List<String> getAllCoordinates(){
        List<String> coordinates = new ArrayList<>();
        for(Bar bar: barRepository.findAll()){
            coordinates.add(bar.getCoordinates());
        }
        return coordinates;
    }
}
