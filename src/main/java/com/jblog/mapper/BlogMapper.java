package com.jblog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jblog.vo.BlogVo;
import com.jblog.vo.CateVo;
import com.jblog.vo.PostVo;

public interface BlogMapper {
	public List<PostVo> getFirstPost(String id);
		
	public List<PostVo> getPostList(int cateno);
	
	public List<CateVo> getCate(String id);
	
	public int insertCate(CateVo catevo);
	
	public int deleteCate(int cateno);
	
	public Integer getTotalPost(int cateno);
	
	public int insertPost(PostVo postVo);
	
	public PostVo getPost(int postno);
	
	public CateVo getFinalCate(@Param("cateno")int cateno,@Param("id") String id);
	
	public int update(BlogVo blogvo);
	
	public BlogVo getBlog(String id);

}
