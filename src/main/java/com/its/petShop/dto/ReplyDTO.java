package com.its.petShop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReplyDTO {
    private Long id;
    private Long boardId;
    private String replyWriter;
    private String replyContents;
    private Timestamp replyCreatedDate;
}
