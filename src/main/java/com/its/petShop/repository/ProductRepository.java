package com.its.petShop.repository;

import com.its.petShop.dto.ProductDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ProductRepository {

    @Autowired
    private SqlSessionTemplate sql;

    public void save(ProductDTO productDTO) {
        sql.insert("Product.save", productDTO);
    }
    

    public ProductDTO findById(Long id) {
        return sql.selectOne("Product.findById", id);
    }

    public List<ProductDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Product.pagingList", pagingParam);
    }

    public int productCount() {
        return sql.selectOne("Product.count");
    }

    public List<ProductDTO> find(Map<String, Object> pagingParam) {
        return sql.selectList("Product.find", pagingParam);
    }

    public int productCount1(String productKind) {
        return sql.selectOne("Product.count1", productKind);
    }

    public List<ProductDTO> search(Map<String, Object> pagingParam) {
        return sql.selectList("Product.search", pagingParam);
    }

    public int searchCount(String search) {
        return sql.selectOne("Product.searchCount", search);
    }

}
