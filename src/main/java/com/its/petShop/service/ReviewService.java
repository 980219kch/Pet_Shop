package com.its.petShop.service;

import com.its.petShop.dto.ReviewDTO;
import com.its.petShop.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    public void save(ReviewDTO reviewDTO) {
        reviewRepository.save(reviewDTO);
    }

    public List<ReviewDTO> findAll(Long productId) {
        return reviewRepository.findAll(productId);
    }
}
