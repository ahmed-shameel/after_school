package com.example.AfterSchool.services;

import com.example.AfterSchool.entities.userEntities.ConfimationToken;
import com.example.AfterSchool.repositories.ConfirmationTokenRepository;
import org.springframework.beans.factory.annotation.Autowired;

public class ConfirmationTokenService {

    @Autowired
    ConfirmationTokenRepository confirmationTokenRepository;

    public void saveConfirmationToken(ConfimationToken confimationToken){
        confirmationTokenRepository.save(confimationToken);
    }
}
