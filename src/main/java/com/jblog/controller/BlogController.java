package com.jblog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jblog.service.BlogService;
import com.jblog.vo.BlogVo;
import com.jblog.vo.CateVo;
import com.jblog.vo.PostVo;

@Controller
@RequestMapping("/blog")
public class BlogController {

	@Autowired
	private BlogService blogService;
	
	public BlogController() {
		System.out.println("blogController....");
	}
	
	//blog 메인
	@GetMapping("/main/{id}")
	public String main(@PathVariable String id, Model model) {
		Map<String,Object> map = new HashMap<String,Object>();
		List<CateVo> cateList = blogService.getCateList(id);		
		
		List<PostVo> postList = blogService.getFirstPost(id);
		BlogVo blogvo = blogService.getBlog(id);
		map.put("blogVo",blogvo);
		map.put("cateList", cateList);
		map.put("postList", postList);
		model.addAttribute("map", map);
				
		return "blog/blog-main";
	}
	
	//포스트 클릭시 포스트 출력
	@RequestMapping("/main/{id}/{cateno}/{postno}")
	public String post(@PathVariable String id,@PathVariable int cateno,@PathVariable int postno, Model model) {
		Map<String,Object> map = new HashMap<String,Object>();	
		PostVo postvo = blogService.getPost(postno);
		List<CateVo> cateList = blogService.getCateList(id);
		List<PostVo> postList = blogService.getList(cateno);
		map.put("cateList", cateList);
		map.put("postList", postList);
		
		BlogVo blogvo = blogService.getBlog(id);
		map.put("blogVo", blogvo);
		model.addAttribute("map", map);
		model.addAttribute("post", postvo);
				
		
		return "blog/blog-main";
	}
	
	
	//blog 카테고리 클릭 시 포스트 출력
	@GetMapping("/main/{id}/{cateno}")
	public String main(@PathVariable String id, @PathVariable int cateno, Model model) {
		Map<String,Object> map = new HashMap<String,Object>();
		List<CateVo> cateList = blogService.getCateList(id);
		
		
		List<PostVo> postList = blogService.getList(cateno);
		map.put("cateList", cateList);
		map.put("postList", postList); 

		BlogVo blogvo = blogService.getBlog(id);
		map.put("blogVo", blogvo);
		model.addAttribute("map", map);
		
		return "blog/blog-main";
	}
	
	
	//카테고리리스트
	@RequestMapping("/cate/{id}")
	public String cate(@PathVariable String id, Model model) {
		Map<String,Object> map = new HashMap<String,Object>();
//		List<CateVo> cateList = blogService.getCateList(id);
//		map.put("cateList", cateList);
		model.addAttribute("id", id);

		BlogVo blogvo = blogService.getBlog(id);
		map.put("blogVo", blogvo);
		model.addAttribute("map", map);

		return "blog/admin/blog-admin-cate";
	}
	
	//카테고리 수정 페이지 카테고리 리스트
	@ResponseBody
	@RequestMapping("/getCateList")
	public Map<String, Object> getCateList(String id) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		
		
		List<CateVo> totalCate = blogService.getCateList(id);	//전체 카테고리 불러오기
		List<CateVo> totalPost = new ArrayList<CateVo>();		//id에 해당하는 카테고리별 포스트수와 전체 카테고리를 담을 그릇
		
		for(int i =0; i<totalCate.size(); i++) {				//전체 카테고리 크기만큼 반복
			int cateno = totalCate.get(i).getCateno();			//각각의 카테고리번호 get			
			totalPost.add(blogService.getFinalCate(cateno,id)); //list에 카테고리별 포스트수가 포함된 카테고리 담기
		}
		
		
		try {
			result.put("cateList", totalPost);
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status",  "False");
		}
		
		return result;
	}

	//카테고리 추가
	@ResponseBody
	@PostMapping("/cateInsert")
	public Map<String,Object> cateInsert(CateVo cateVo) throws Exception {
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			blogService.insertCate(cateVo);
			result.put("status","OK");
		}catch(Exception e) {
			result.put("status","false");
		}	
		
		return result;
	}
	

	@ResponseBody
	@RequestMapping("/cateDelete")
	public Map<String, Object> cateDelete(String cateno, String id) {
		Map<String, Object> result = new HashMap<String, Object>();
		int no = Integer.parseInt(cateno);
		try {
			CateVo vo = blogService.getFinalCate(no,id);
			
			if(vo.getTotalpost()==0) {
			
			blogService.deleteCate(no);
			result.put("status","OK");
			}else {
				result.put("status","False");
			}
			
		}catch (Exception e) {
			result.put("status", "False");
		}
		return result;
	}
	
	//글작성폼
	@RequestMapping("/write/{id}")
	public String writeForm(@PathVariable String id, Model model) {
		Map<String,Object> map = new HashMap<String,Object>();
		List<CateVo> cateList = blogService.getCateList(id);
		map.put("cateList", cateList);
		BlogVo blogvo = blogService.getBlog(id);
		map.put("blogVo", blogvo);
		model.addAttribute("map", map);
		
	
		
		return "blog/admin/blog-admin-write";
	}
	

	//글작성
	@RequestMapping("/writePost/{id}")
	public String write(@PathVariable String id, Model model,@ModelAttribute PostVo postVo) {
		
		int count = blogService.writePost(postVo);
		
		return "redirect:/blog/main/"+id+"/"+postVo.getCateno();
	}
	
	//수정폼 출력
	@RequestMapping("/modifyForm/{id}")
	public String modifyForm(@PathVariable String id, Model model) {
		Map<String,Object> map = new HashMap<String,Object>();
		BlogVo blogvo = blogService.getBlog(id);
		map.put("blogVo", blogvo);
		model.addAttribute("map", map);

		return "blog/admin/blog-admin-basic";
	}
	
	@RequestMapping("/modify/{id}")
	public String modify(@PathVariable String id,@ModelAttribute BlogVo blogvo, Model model) {
		int count = blogService.update(blogvo);
		
		BlogVo vo = blogService.getBlog(id);
		
		String blogTitle = vo.getBlogtitle();
		System.out.println(blogTitle);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("blogTitle", blogTitle);
		model.addAttribute("blog", map);
		return "redirect:/blog/main/"+id;
	}
	//redirect:/blog/main/"+id
	
	

	
	
}
