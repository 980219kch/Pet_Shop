package com.its.petShop.repository;

import com.its.petShop.dto.ReplyDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReplyRepository {

    @Autowired
    private SqlSessionTemplate sql;

    public void save(ReplyDTO replyDTO) {
        sql.insert("Reply.save", replyDTO);
    }

    public List<ReplyDTO> findAll(Long boardId) {
        return sql.selectList("Reply.findAll", boardId);
    }
}
