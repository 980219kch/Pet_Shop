package com.its.petShop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDTO {
    private Long id;
    private Long productId;
    private String memberId;
    private int productPrice;
    private String productName;
    private int productCount;
    private MultipartFile productFile;
    private String productFileName;
}
