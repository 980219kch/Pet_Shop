package com.its.petShop.controller;

import com.its.petShop.dto.MemberDTO;
import com.its.petShop.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveForm() {
        return "memberPages/save";
    }

    @PostMapping("/save")
    public String save(MemberDTO memberDTO) {
        memberService.save(memberDTO);
        return "memberPages/login";
    }

    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId) {
        String checkResult = memberService.duplicateCheck(memberId);
        return checkResult;
    }

    @GetMapping("/login")
    public String loginForm() {
        return "memberPages/login";
    }

    @PostMapping("/login")
    public String login(MemberDTO memberDTO, HttpSession session, Model model) {
        MemberDTO loginMember = memberService.login(memberDTO);
        if(loginMember != null) {
            System.out.println("로그인 성공");
            model.addAttribute("loginMember", loginMember);
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            return "main";
        } else {
            System.out.println("로그인 실패");
            return "memberPages/login";
        }
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        System.out.println("로그아웃 성공");
        return "main";
    }

    @GetMapping("/my-page")
    public String myPage() {
        return "memberPages/myPage";
    }

    @GetMapping("/update")
    public String updateForm(HttpSession session, Model model) {
        String id = (String) session.getAttribute("loginMemberId");
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("updateMember", memberDTO);
        return "memberPages/update";
    }

    @PostMapping("/update")
    public String update(MemberDTO memberDTO) {
        memberService.update(memberDTO);
        return "memberPages/myPage";
    }

    @GetMapping("/delete")
    public String deleteForm(HttpSession session, Model model) {
        String id = (String) session.getAttribute("loginMemberId");
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("deleteMember", memberDTO);
        return "memberPages/delete";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("memberId") String memberId) {
        memberService.delete(memberId);
        return "redirect:/member/logout";
    }

    @GetMapping("/admin")
    public String admin() {
        return "adminPages/admin";
    }

    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "adminPages/memberList";
    }
}
