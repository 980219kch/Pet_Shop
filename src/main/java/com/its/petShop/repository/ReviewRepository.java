package com.its.petShop.repository;

import com.its.petShop.dto.ReviewDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewRepository {

    @Autowired
    private SqlSessionTemplate sql;


    public void save(ReviewDTO reviewDTO) {
        sql.insert("Review.save", reviewDTO);
    }

    public List<ReviewDTO> findAll(Long productId) {
        return sql.selectList("Review.findAll", productId);
    }
}
