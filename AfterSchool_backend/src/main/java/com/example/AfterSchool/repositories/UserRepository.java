package com.example.AfterSchool.repositories;
import com.example.AfterSchool.entities.userEntities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {

    public User findByFirstNameAndLastName(String firstName, String lastName);
    public User findByUsername(String userName);
    public boolean existsByEmail(String email);
    public boolean existsByUsername(String username);
}
