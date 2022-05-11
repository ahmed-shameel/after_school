package com.example.AfterSchool.services;
import com.example.AfterSchool.entities.userEntities.ConfirmationToken;
import com.example.AfterSchool.repositories.ConfirmationTokenRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@AllArgsConstructor
public class ConfirmationTokenService {

    private final ConfirmationTokenRepository confirmationTokenRepository;

    public void saveConfirmationToken(ConfirmationToken confimationToken){
        confirmationTokenRepository.save(confimationToken);
    }

    public void deleteConfirmationToken(Long id){
        confirmationTokenRepository.deleteById(id);
    }

    public Optional<ConfirmationToken> findConfirmationTokenByToken(String token) {
        return confirmationTokenRepository.findConfirmationTokenByToken(token);
    }
}
