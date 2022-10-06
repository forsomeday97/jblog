<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
</head>
<body>
	<div class="center-content">
<%@include file="../includes/header.jsp"%>
		
		
		
		<form class="login-form" method="post" action="/user/login">
      		<label>아이디</label> 
      		<input type="text" name="id">
      		
      		<label>패스워드</label> 
      		<input type="text" name="password">
      		
      		<c:if test="${result eq false}">
	      		<p class="form-error" style="color:red;">
					로그인 실패<br>
				</p>
					
					아이디/패스워드를 확인해 주세요
      		</c:if>
      		
      		<input type="submit" value="로그인">
		</form>
		
	</div>
</body>

</html>