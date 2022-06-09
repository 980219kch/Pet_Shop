package com.its.petShop.service;

import com.its.petShop.dto.CartDTO;
import com.its.petShop.dto.ProductDTO;
import com.its.petShop.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CartService {

    @Autowired
    private CartRepository cartRepository;


    public void save(CartDTO cartDTO) {
        cartRepository.save(cartDTO);
    }


    public List<CartDTO> findAll(String memberId) {
        return cartRepository.findAll(memberId);
    }
}
