package com.its.petShop.controller;

import com.its.petShop.dto.ReplyDTO;
import com.its.petShop.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/reply")
public class ReplyController {

    @Autowired
    private ReplyService replyService;

    @PostMapping("/save")
    public @ResponseBody List<ReplyDTO> save(@ModelAttribute ReplyDTO replyDTO) {
        replyService.save(replyDTO);
        List<ReplyDTO> replyDTOList = replyService.findAll(replyDTO.getBoardId());
        return replyDTOList;
    }
}
