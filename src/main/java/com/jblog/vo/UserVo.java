package com.jblog.vo;


import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class UserVo {
	private int userno;
	
	@NotEmpty
	private String id;

	@NotEmpty
	private String username;
	private String password;
	private String joindate;
}
