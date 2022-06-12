package com.its.petShop.service;

import com.its.petShop.dto.ReplyDTO;
import com.its.petShop.repository.ReplyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyService {

    @Autowired
    private ReplyRepository replyRepository;


    public void save(ReplyDTO replyDTO) {
        replyRepository.save(replyDTO);
    }

    public List<ReplyDTO> findAll(Long boardId) {
        return replyRepository.findAll(boardId);
    }
}
