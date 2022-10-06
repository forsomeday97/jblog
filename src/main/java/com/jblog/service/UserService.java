package com.jblog.service;

import com.jblog.vo.UserVo;

public interface UserService {

	public boolean join(UserVo userVo);
	
	public boolean existId(String id);
	
	public boolean login(UserVo userVo);
	
	public String uname(UserVo userVo);
	
	public int blogInsert(String id, String username);

}
