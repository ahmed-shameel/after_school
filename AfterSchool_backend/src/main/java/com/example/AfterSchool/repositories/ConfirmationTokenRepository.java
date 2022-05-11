package com.example.AfterSchool.repositories;
import com.example.AfterSchool.entities.userEntities.ConfirmationToken;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface ConfirmationTokenRepository extends CrudRepository<ConfirmationToken, Long> {

    public Optional<ConfirmationToken> findConfirmationTokenByToken(String token);
}
