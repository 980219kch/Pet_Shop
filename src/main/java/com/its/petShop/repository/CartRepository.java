package com.its.petShop.repository;

import com.its.petShop.dto.CartDTO;
import com.its.petShop.dto.ProductDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CartRepository {

    @Autowired
    private SqlSessionTemplate sql;


    public void save(CartDTO cartDTO) {
        sql.insert("Cart.save", cartDTO);
    }


    public List<CartDTO> findAll(String memberId) {
        return sql.selectList("Cart.findAll", memberId);
    }

    public int countCart(Long productId, String memberId) {
        Map<String, Object> map = new HashMap<>();
        map.put("productId", productId);
        map.put("memberId", memberId);
        return sql.selectOne("Cart.countCart", map);
    }

    public void updateCart(CartDTO cartDTO) {
        sql.update("Cart.sumCart", cartDTO);
    }

    public void delete(Long id) {
        sql.delete("Cart.delete", id);
    }
}
