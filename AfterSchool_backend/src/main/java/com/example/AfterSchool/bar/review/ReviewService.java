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

    public Review makeReview(Review review){
        reviewRepository.save(review);

        Bar bar = barRepository.findByName(review.getBar());
        User user = userRepository.findUserByUsername(review.getUser()).get();

        bar.addReview(review);
        user.addReview(review);
        return review;
    }
}
