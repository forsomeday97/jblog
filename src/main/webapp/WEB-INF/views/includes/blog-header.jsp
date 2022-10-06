<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<link rel="stylesheet" type="text/css" href="/resources/css/jblog.css">
	
		<!-- 블로그 해더 -->
		<div id="header">		
			<h1><a href="/blog/main/${id}">${map.blogVo.blogtitle}</a></h1>
				<!-- 로그인 전 메뉴 -->
		<ul>		
		<c:choose>
			<c:when test='${empty username}'>
				<li><a href="/user/login">로그인</a></li>
			</c:when>
			<c:otherwise>	
				<!-- 로그인 후 메뉴 --> 
				<li><a href="/user/logout">로그아웃</a></li>
				
				<li><a href="/blog/modifyForm/${id}">내블로그 관리</a></li>
				
			</c:otherwise>
		</c:choose>		
		</ul>
		</div>
