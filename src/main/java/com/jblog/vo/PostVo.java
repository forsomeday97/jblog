package com.jblog.vo;

import lombok.Data;

@Data
public class PostVo {
	private int postno;
	private int cateno;
	private String posttitle;
	private String postcontent;
	private String regdate;
}
