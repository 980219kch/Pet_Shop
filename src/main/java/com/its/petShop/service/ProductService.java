package com.its.petShop.service;

import com.its.petShop.dto.PageDTO;
import com.its.petShop.dto.ProductDTO;
import com.its.petShop.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public void save(ProductDTO productDTO) throws IOException {
        MultipartFile productFile = productDTO.getProductFile();
        String productFileName = productFile.getOriginalFilename();
        productFileName = System.currentTimeMillis() + "-" + productFileName;
        productDTO.setProductFileName(productFileName);
        String savePath = "C:\\project_img\\" + productFileName;
        if(!productFile.isEmpty()) {
            productFile.transferTo(new File(savePath));
        }
        productRepository.save(productDTO);
    }



    public ProductDTO findById(Long id) {
        return productRepository.findById(id);
    }

    private static final int PAGE_LIMIT = 4;

    private static final int BLOCK_LIMIT = 3;
    public List<ProductDTO> pagingList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<ProductDTO> pagingList = productRepository.pagingList(pagingParam);
        return pagingList;
    }

    public PageDTO paging(int page) {
        int productCount = productRepository.productCount();
        int maxPage = (int)(Math.ceil((double)productCount / PAGE_LIMIT));
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }
}
