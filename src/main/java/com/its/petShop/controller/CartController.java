package com.its.petShop.controller;

import com.its.petShop.dto.CartDTO;
import com.its.petShop.dto.ProductDTO;
import com.its.petShop.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @PostMapping("/save")
    public String save(@ModelAttribute CartDTO cartDTO, HttpSession session) {
        System.out.println("cartDTO = " + cartDTO);
        String memberId = (String) session.getAttribute("loginMemberId");
        cartDTO.setMemberId(memberId);
        cartService.save(cartDTO);
        return "productPages/list";
    }

}
