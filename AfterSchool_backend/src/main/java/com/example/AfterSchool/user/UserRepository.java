package com.example.AfterSchool.user;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Repository
@Transactional(readOnly = true)
public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByEmail(String email);
    Optional<User> findUserByUsername(String username);
    Optional<User> findByEmailAndPassword(String email, String password);
    User getUserByUsername(String username);


}
