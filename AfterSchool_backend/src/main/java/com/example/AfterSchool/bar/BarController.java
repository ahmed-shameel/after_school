package com.example.AfterSchool.bar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BarController {

    @Autowired
    private BarService barService;

    @GetMapping(path="/bars")
    public @ResponseBody
    Iterable<Bar> getAllBars() {
        // This returns a JSON or XML with the users
        return barService.getAllBars();
    }

    @GetMapping(path = "/allcoordinates")
    public @ResponseBody
    Iterable<String> getCoordinates(){

        return barService.getAllCoordinates();
    }
}
