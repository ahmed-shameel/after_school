package com.example.AfterSchool;
import com.example.AfterSchool.entities.User;
import com.example.AfterSchool.repositories.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class AfterSchoolApplication {

	public static void main(String[] args) {
		SpringApplication.run(AfterSchoolApplication.class, args);
	}

	@Bean
	CommandLineRunner commandLineRunner(UserRepository userRepository){
		return args -> {
			userRepository.save(new User("ahmedalseify96@gmail.com", "MrFit", "Ahmed", "Shameel", "gg"));
		};
	}
}
