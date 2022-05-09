package com.example.AfterSchool.repositories;
import com.example.AfterSchool.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {

    public User findByFirstNameAndLastName(String firstName, String lastName);
    public User findByEmail(String email);
    public User findByUserName(String userName);
    public boolean existsByEmail(String email);
}
