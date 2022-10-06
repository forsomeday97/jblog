<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/includes/blog-header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<script>
	$(function(){
		fn_showList();
	});
	function fn_showList(){
		var paramData ={"id" : "${id}"}
		
		$.ajax({
			url:"/blog/getCateList"
		   ,type:"POST"
		   ,dataType:"json"
		   ,data:paramData
		   ,success:function(result){
			   console.log(result);
			   
			   if(result.status =="OK"){
				   if(result.cateList.length>0){
					   var list = result.cateList;
					   var htmls ="";
					   result.cateList.forEach(function(e){
						    htmls += '<tr>';
							htmls += '<td>' + e.cateno + '</td>';
							htmls += '<td>' + e.catename + '</td>';
							htmls += '<td>' + e.totalpost + '</td>';
							htmls += '<td>' + e.description + '</td>';
							htmls += "<td><button type='button' id='delete' value='"+e.cateno+"'><img src='${pageContext.request.contextPath}/resources/images/delete.jpg'></a></td>";
							htmls += '</tr>';
							
					   });
				   }
			   }else{
				   console.log("조회실패");
			   }
			   $('#cateList').html(htmls);
		   }
		});
	}
	
	$(document).on('click', '#delete',function(e){
		e.preventDefault();
		
		var url="/blog/cateDelete";
		var paramData = {
				"cateno":  $(this).attr('value')
				,"id" : "${id}"
		};
		$.ajax({
			url:url
			, type : "POST"
			, dataType : "json"
			, data : paramData
			, success : function(result){
				if(result.status =="False"){
					alert("삭제할 수 없습니다.");	 
				 }
			fn_showList();
				
				 
			}
		});
		
	
	});
	
	
	$(document).on('click', '#btnAddCate',function(e){
		e.preventDefault();
		var url = "/blog/cateInsert";
		var paramData = {
				"id" : $("#id").val()
				,"catename" : $("#catename").val()
				,"description" : $("#description").val()
		};
		
		$.ajax({
			url : url
			,type : "POST"
			,datatype : "json"
			,data : paramData
			,success : function(result){
				fn_showList();
			}
		});
	});
	
	

	
//	$(document).on('click', '#btnAddCate', function(e){
//		$.ajax({
//			url : url
//			,type : "POST"
//			,dataType : "json"
//			,data : paramData
//			,success : function(result){
//				fn_showList();
//			}
//			
//		});
//	});
	
</script>

<body>

	<div id="container">

		
		<div id="wrapper">
			<div id="content" class="full-screen">
				<ul class="admin-menu">
					<li><a href="/blog/modifyForm/${id}">기본설정</a></li>
					<li class="selected"><a href="/blog/cate/${id}">카테고리</a></li>
					<li><a href="/blog/write/${id}">글작성</a></li>
				</ul>
				
		      	<table class="admin-cat">
		      		<thead>
			      		<tr>
			      			<th>번호</th>
			      			<th>카테고리명</th>
			      			<th>포스트 수</th>
			      			<th>설명</th>
			      			<th>삭제</th>      			
			      		</tr>
		      		</thead>
					<tbody id="cateList">
					</tbody>

				</table>
      	
      			<h4 class="n-c">새로운 카테고리 추가</h4>
      		<form:form name="form" id="form" modelAttribute="cateVo" action="/blog/cateInsert" method="post" >
      			<input type="hidden" id="id" value="${id}"/>
		      	<table id="admin-cat-add" >
		      		<tr>
		      			<td class="t">카테고리명</td>
		      			<td><input type="text" id="catename" name="name" value=""></td>
		      		</tr>
		      		<tr>
		      			<td class="t">설명</td>
		      			<td><input type="text" id="description" name="desc"></td>
		      		</tr>
		      		<tr>
		      			<td class="s">&nbsp;</td>
		      			<td><input id="btnAddCate" type="button" value="카테고리 추가"></td>
		      		</tr>      		      		
		      	</table> 
		      </form:form>	
			</div>
		</div>
		
		<!-- 푸터-->
		<div id="footer">
			<p>
				<strong>Spring 이야기</strong> is powered by JBlog (c)2018
			</p>
		</div>
	</div>
</body>



</html>