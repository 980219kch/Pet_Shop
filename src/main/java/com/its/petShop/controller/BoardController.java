package com.its.petShop.controller;

import com.its.petShop.dto.BoardDTO;
import com.its.petShop.dto.PageDTO;
import com.its.petShop.dto.ReplyDTO;
import com.its.petShop.service.BoardService;
import com.its.petShop.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private ReplyService replyService;

    @GetMapping("/save")
    public String saveForm() {
        return "boardPages/save";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) {
        boardService.save(boardDTO);
        return "redirect:/board/findAll";
    }

    @GetMapping("/paging")
    public String findAll(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
        List<BoardDTO> boardDTOList = boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardDTOList);
        model.addAttribute("paging", paging);
        return "boardPages/board";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        List<ReplyDTO> replyDTOList = replyService.findAll(id);
        model.addAttribute("replyList", replyDTOList);
        return "boardPages/detail";
    }
}
