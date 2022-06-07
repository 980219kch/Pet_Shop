package com.its.petShop.service;

import com.its.petShop.dto.MemberDTO;
import com.its.petShop.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;
    public void save(MemberDTO memberDTO) {
        memberRepository.save(memberDTO);
    }
}
