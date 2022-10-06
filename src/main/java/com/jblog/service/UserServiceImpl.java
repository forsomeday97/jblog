package com.jblog.service;

import org.springframework.stereotype.Service;

import com.jblog.mapper.UserMapper;
import com.jblog.vo.UserVo;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	private UserMapper mapper;
	
	public boolean join(UserVo userVo) {
		System.out.println("test:::"+userVo);
		int count = mapper.insert(userVo);
		
		return 1 == count;
	}
	
	public boolean existId(String id) {
		UserVo uservo = mapper.get(id);
		return uservo != null;
	}

	public boolean login(UserVo userVo) {
		
		UserVo vo = mapper.getByIdAndPassword(userVo);
		
		return vo != null;
	}

	public String uname(UserVo userVo) {
			
		String uname= mapper.getUserName(userVo);
		
		return uname;
	}


	public int blogInsert(String id,String username) {
		
		String bname = username+"님의 블로그 입니다";
		
		return mapper.blogInsert(id, bname);
	}
}
