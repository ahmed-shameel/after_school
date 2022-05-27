package com.example.AfterSchool.bar.review;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
public class ReviewController {

    private final ReviewService reviewService;

    @PostMapping(path = "makereview")
    public Review makeReview(@RequestBody Review review){
        return reviewService.makeReview(review);
    }
}
