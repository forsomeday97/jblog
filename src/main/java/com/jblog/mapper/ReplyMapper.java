package com.jblog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jblog.vo.CommentsVo;

public interface ReplyMapper {
	public int insert(CommentsVo reply);
    public CommentsVo read(Long bno);
    public int delete(Long rno);
    public int update(CommentsVo reply);


    
}
