package com.its.petShop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
    private Long id;
    private String productName;
    private String productKind;
    private int productPrice;
    private int productCount;
    private String productDetail;
    private MultipartFile productFile;
    private String productFileName;
}
