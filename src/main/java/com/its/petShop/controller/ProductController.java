package com.its.petShop.controller;

import com.its.petShop.dto.PageDTO;
import com.its.petShop.dto.ProductDTO;
import com.its.petShop.service.ProductService;
import com.its.petShop.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ReviewService reviewService;
    @GetMapping("/save")
    public String saveForm() {
        return "productPages/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute ProductDTO productDTO) throws IOException {
        productService.save(productDTO);
        return "/adminPages/admin";
    }

    @GetMapping("/findAll")
    public String findAll(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
        List<ProductDTO> productDTOList = productService.pagingList(page);
        PageDTO paging = productService.paging(page);
        model.addAttribute("productList", productDTOList);
        model.addAttribute("paging", paging);
        return "productPages/list";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") Long id, Model model,
                         @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        ProductDTO productDTO = productService.findById(id);
        model.addAttribute("product", productDTO);
        model.addAttribute("page", page);
        return "productPages/detail";
    }

    @GetMapping("/find")
    public String find(@RequestParam("productKind") String productKind,
                       @RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
        List<ProductDTO> productDTOList = productService.find(productKind, page);
        PageDTO paging = productService.paging1(productKind, page);
        model.addAttribute("productList", productDTOList);
        model.addAttribute("paging", paging);
        return "productPages/feed-list";
    }

    @GetMapping("/search")
    public String search(@RequestParam("text") String search,
                         @RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
        List<ProductDTO> searchList = productService.search(search, page);
        PageDTO paging = productService.pagingSearch(search, page);
        model.addAttribute("productList", searchList);
        model.addAttribute("paging", paging);
        return "productPages/list";
    }

}
