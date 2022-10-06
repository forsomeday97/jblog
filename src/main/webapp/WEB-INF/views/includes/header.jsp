<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<link rel="stylesheet" type="text/css" href="/resources/css/jblog.css">
	
	<!-- 메인해더 -->
	<a href="${pageContext.servletContext.contextPath }/main"> 
	<img class="logo" src="/resources/images/logo.jpg">
	</a>
	<ul class="menu">
	<c:choose>
		<c:when test='${empty id }'>
			<li><a
				href="${pageContext.servletContext.contextPath }/user/login">로그인</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/user/join">회원가입</a></li>
		</c:when>
		<c:otherwise> 
			<li><a href="/user/logout">로그아웃</a></li>
			<li><a href="/blog/main/${id}">내블로그</a></li>
		</c:otherwise> 
	</c:choose>	
	</ul>