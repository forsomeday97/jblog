package com.jblog.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jblog.vo.BlogVo;
import com.jblog.vo.CateVo;
import com.jblog.vo.PostVo;

@Service
public interface BlogService {
	public List<PostVo> getList(int cateno);
	public List<PostVo> getFirstPost(String id);

	public List<CateVo> getCateList(String id);
	
	public int deleteCate(int cateno);
	
	public int insertCate(CateVo catevo);
	
	public Integer getTotalPost(int cateno);
	
	public int writePost(PostVo postVo);
	
	public PostVo getPost(int postno);
	
	public CateVo getFinalCate(int cateno, String id);
	
	public int update(BlogVo blogvo);
	
	public BlogVo getBlog(String id);
}
