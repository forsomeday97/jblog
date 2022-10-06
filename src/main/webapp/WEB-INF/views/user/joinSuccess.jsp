<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
</head>
<body>
<%@include file="../includes/header.jsp"%>
	<a href="${pageContext.servletContext.contextPath }/main"> 
	</a>
	<div class="center-content">
		<p class="welcome-message">
		<img src="/resources/images/bul1.gif">
			<span> 감사합니다.
				       회원 가입 및 블로그가 성공적으로 만들어 졌습니다.
		    </span>    
		<img src="/resources/images/bul2.gif">
		    
			<br><br>
			<a href="/user/login">로그인 하기</a>
		</p>
		
	</div>
</body>
</html>
