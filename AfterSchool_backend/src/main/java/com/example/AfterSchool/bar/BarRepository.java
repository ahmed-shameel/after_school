package com.example.AfterSchool.bar;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BarRepository extends JpaRepository<Bar, String> {

    Bar findByName(String name);
}
