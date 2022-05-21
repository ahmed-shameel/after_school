package com.example.AfterSchool.bar;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BarRepo extends JpaRepository<Bar, String> {
}
