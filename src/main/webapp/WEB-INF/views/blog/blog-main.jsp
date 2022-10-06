<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
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
			<div id="content">
				<div class="blog-content">
				<c:choose>
					<c:when test="${post eq null}">
						
							<h4>${map.postList[0].posttitle }</h4>
							<p>
								${map.postList[0].postcontent}
							</p>
						
					</c:when>
						<c:otherwise>	
							<h4>${post.posttitle }</h4>
							<p>
								${post.postcontent}
							</p>
						</c:otherwise>
						
				</c:choose>
				<c:if test="${empty map.postList}"><h4>게시글이 없습니다</h4></c:if>
									
					</div>
				<ul class="blog-list">
					
					<c:forEach var="PostVo" items="${map.postList}">
					<li><a href="/blog/main/${id}/${PostVo.cateno}/${PostVo.postno}">${PostVo.posttitle }</a><span>${PostVo.regdate }</span></li> 
					</c:forEach>	
					
				</ul>
			</div>
		</div>

		<div id="extra">
			<div class="blog-logo">
				<img src="${pageContext.request.contextPath}/resources/images/spring-logo.jpg">				
			</div>
		</div>

		<div id="navigation">
			<h2>카테고리</h2>
			<ul>
				<c:forEach var="catevo" items="${map.cateList }">
					<li><a href="/blog/main/${id}/${catevo.cateno}">${catevo.catename }</a></li>
				</c:forEach>
				
			</ul>
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