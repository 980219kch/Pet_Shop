package com.its.petShop.controller;

import com.its.petShop.dto.ProductDTO;
import com.its.petShop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/save")
    public String saveForm() {
        return "productPages/save";
    }

    @PostMapping("/save")
    public String save(ProductDTO productDTO) throws IOException {
        productService.save(productDTO);
        return "/adminPages/admin";
    }

    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<ProductDTO> productDTOList = productService.findAll();
        model.addAttribute("productList", productDTOList);
        return "productPages/list";
    }


}
