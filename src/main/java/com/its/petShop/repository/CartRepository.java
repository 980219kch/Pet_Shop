package com.its.petShop.repository;

import com.its.petShop.dto.CartDTO;
import com.its.petShop.dto.ProductDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class CartRepository {

    @Autowired
    private SqlSessionTemplate sql;


    public void save(CartDTO cartDTO) {
        sql.insert("Cart.save", cartDTO);
    }
}
