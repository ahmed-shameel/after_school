package com.example.AfterSchool.bar.review;

import com.example.AfterSchool.bar.Bar;
import com.example.AfterSchool.bar.BarRepository;
import com.example.AfterSchool.user.User;
import com.example.AfterSchool.user.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;


@AllArgsConstructor
@Service
public class ReviewService {

    private final ReviewRepository reviewRepository;
    private final BarRepository barRepository;
    private final UserRepository userRepository;

    public Review makeReview(String bar, String text, String user){
//
//        if(userRepository.findByUsername(user).isEmpty()){
//            throw new IllegalStateException("no user found");
//        }
//
//        if(barRepository.findById(bar).isEmpty()){
//            throw new IllegalStateException("No bar found");
//        }

        User foundUser = userRepository.findByUsername(user).get();
        Bar foundBar = barRepository.getById(bar);

        Review review = new Review(foundUser, 3, text);

        reviewRepository.save(review);
        foundBar.addReview(review);
        foundUser.addReview(review);
        return review;
    }
}
