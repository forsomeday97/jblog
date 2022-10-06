package com.jblog.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.jblog.mapper.BlogMapper;
import com.jblog.vo.BlogVo;
import com.jblog.vo.CateVo;
import com.jblog.vo.PostVo;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BlogServiceImpl implements BlogService {

	private BlogMapper blogMapper;

	public List<PostVo> getFirstPost(String id) {

		List<PostVo> postvo = blogMapper.getFirstPost(id);

		return postvo;
	}
	

	public List<PostVo> getList(int cateno) {
		List<PostVo> list = blogMapper.getPostList(cateno);
		System.out.println(list.toString());
		return list;
	}

	public List<CateVo> getCateList(String id) {
		System.out.println(id);
		List<CateVo> a = blogMapper.getCate(id);
		System.out.println(a);
		return blogMapper.getCate(id);
	}

	public int insertCate(CateVo catevo) {
	
		return blogMapper.insertCate(catevo);
	}


	public int deleteCate(int cateno) {
		
		return blogMapper.deleteCate(cateno);
	}

	public Integer getTotalPost(int cateno) {

		return blogMapper.getTotalPost(cateno);
	}

	public int writePost(PostVo postVo) {

		return blogMapper.insertPost(postVo);
	}

	public PostVo getPost(int postno) {
		
		return blogMapper.getPost(postno);
	}


	public CateVo getFinalCate(int cateno, String id) {

		return blogMapper.getFinalCate(cateno,id);
	}

	public int update(BlogVo blogvo) {

		return blogMapper.update(blogvo);
	}
	
	public BlogVo getBlog(String id) {
		
		return blogMapper.getBlog(id);
	}
	
	

}
