<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/includes/blog-header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>

	<div id="container">
		
		<div id="wrapper">
			<div id="content" class="full-screen">
				<ul class="admin-menu">
					<li><a href="/blog/modifyForm/${id}">기본설정</a></li>
					<li><a href="/blog/cate/${id}">카테고리</a></li>
					<li class="selected"><a href="/blog/write/${id}">글작성</a></li>
				</ul>
				
				<form action="/blog/modify/${id}" method="post">
	 		      	<table class="admin-config">
			      		<tr>
			      			<td class="t">블로그 제목</td>
			      			<td><input type="text" size="40" name="blogtitle" value=""></td>
			      		</tr>
			      		<tr>
			      		<c:choose>
			      			<c:when test="${map.blogVo.logofile eq null }">
			      			<td><img src="${pageContext.request.contextPath}/resources/images/spring-logo.jpg"></td>
			      			</c:when>
			      			<c:otherwise>
			      			<td class ="select_img"><img src=""></td>
			      			</c:otherwise>
			      		</c:choose> 
			      		</tr>      		
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td><input type="file" name="file" id="profil" accept=".jpg, .png">

			      			 </td>		
			      		</tr> 
			      		
			      		       		
			      		<tr>
			      			<td class="t">&nbsp;</td>
			      			<td class="s"><input type="submit" value="기본설정 변경"></td>      			
			      		</tr>           		
			      	</table>
				</form>
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

<!-- 
<c:choose>
			      			<c:when test="${map.blogVo.logofile eq null }">
			      			<td><img src="${pageContext.request.contextPath}/resources/images/spring-logo.jpg"></td>
			      			</c:when>
			      			<c:otherwise>
			      			<td class ="select_img"><img src=""></td>
			      			</c:otherwise>
		      			
			      		</c:choose> 
 -->

</html>