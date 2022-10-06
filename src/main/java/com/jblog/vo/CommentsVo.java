package com.jblog.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class CommentsVo {
	private int cmtno;
	private int postno;
	private int userno;
	private String cmtcontent;
	private String regdate;
}
