package com.its.petShop.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardDTO {
    private Long id;
    private String memberId;
    private String boardTitle;
    private String boardContents;
    private Timestamp boardCreatedDate;
}
