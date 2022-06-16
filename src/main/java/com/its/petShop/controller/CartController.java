package com.its.petShop.controller;

import com.its.petShop.dto.CartDTO;
import com.its.petShop.dto.MemberDTO;
import com.its.petShop.dto.ProductDTO;
import com.its.petShop.service.CartService;
import com.its.petShop.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private MemberService memberService;

    @PostMapping("/save")
    public String save(@ModelAttribute CartDTO cartDTO, HttpSession session) {
        System.out.println("cartDTO = " + cartDTO);
        String memberId = (String) session.getAttribute("loginMemberId");
        cartDTO.setMemberId(memberId);
        int productCount = cartService.countCart(cartDTO.getProductId(), memberId);
        if(productCount == 0) {
            cartService.save(cartDTO);
        } else {
            cartService.updateCart(cartDTO);
        }
        return "redirect:/product/findAll";
    }

    @GetMapping("/findAll")
    public String findAll(HttpSession session, Model model) {
        String memberId = (String) session.getAttribute("loginMemberId");
        List<CartDTO> cartDTOList = cartService.findAll(memberId);
        MemberDTO memberDTO = memberService.findById(memberId);
        model.addAttribute("cartList", cartDTOList);
        model.addAttribute("member", memberDTO);
        return "cartPages/cart";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        cartService.delete(id);
        return "redirect:/cart/findAll";
    }



}
