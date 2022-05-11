package com.example.AfterSchool.repositories;

import com.example.AfterSchool.entities.userEntities.ConfimationToken;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ConfirmationTokenRepository extends JpaRepository<ConfimationToken, Long> {

}
