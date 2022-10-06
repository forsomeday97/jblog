package com.jblog.mapper;

import org.apache.ibatis.annotations.Param;

import com.jblog.vo.UserVo;

public interface UserMapper {

	public int insert(UserVo userVo);

	public UserVo get(String id);
	
	public UserVo getByIdAndPassword(UserVo userVo);
	
	public String getUserName(UserVo userVo);
	
	public int blogInsert(@Param("id")String id,@Param("bname")String bname);


}
