package com.example.AfterSchool;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AfterSchoolController {

    @GetMapping("/hello")
    public String hell(@RequestParam(value = "name", defaultValue = "world") String name){
        return "hello " + name;
    }
}