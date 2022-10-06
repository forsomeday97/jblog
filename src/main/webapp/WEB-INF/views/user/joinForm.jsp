<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script>

window.onload = function() {
	const agree= document.querySelector('#agreeprov')
	const username = document.querySelector('#username');
	const idForm = document.querySelector('#id');
	const passwordForm = document.querySelector('#password');
	const loginButton = document.querySelector('#submit-button');
	var chk="false";

	
	idForm.addEventListener('keyup', listener);
	passwordForm.addEventListener('keyup', listener);
	username.addEventListener('keyup', listener);
	agree.addEventListener('change',listener)
	
	function listener() {
		var checked = $('#agreeprov').is(':checked');
		if(checked){
			var chk=true;
		}
	    switch (!(idForm.value && passwordForm.value && username.value && chk==true)) {
	        case true: loginButton.disabled = true; break;
	        case false: loginButton.disabled = false; break;
	    }
	}
};
	
	function check(){
	   if($("input[name='idc']").val()=='unchecked'){
		$("#checkid-msg").text("먼저 중복체크 해주세요.")
		$("#checkid-msg").css("color", "red")
		$('#id').focus();
        return false;
    	}

    };  


	$(function(){
		$('#id').change(function(){
			$('#btn-checkid').show();
			$('#check-image').hide();
		});
	$('#btn-checkid').on("click",function(){
		var id = $('#id').val();
		if(id ==''){
			return;
		}
		
		$.ajax({
			url:"/user/api/checkId?id="+id , //문자열로 인식이 되는게 아니라 서버에서 el값으로 먼저 치환후 js통신을 한다.
			method :"get",
			dateType:"json",
			success:function(response){
				console.log(response);
				if(response == "true"){
					$("#checkid-msg").text("다른 아이디로 가입해 주세요")
					$("#checkid-msg").css("color", "red")
					$('#id').focus();
					$('#id').val("");
					return;
				}
				$("#checkid-msg").text("")
				$('#btn-checkid').hide();
				$('#check-image').show();
				$("input[name=idc]").val('y');
			},
			error : function(xhr,error){
					console.error("error:"+error);
			}
		});
	})
	});
	
	

</script>


<body>
	<div class="center-content">
	<%@include file="../includes/header.jsp"%>
	
		<form:form modelAttribute="userVo" class="join-form" id="join-form" method="post" action="/user/join" onsubmit="return check();">
			<label class="block-label" for="name">이름</label>
			<input type="text" name="username" id="username"  value="" />
			
			<spring:hasBindErrors name="userVo">
				<c:if test="${errors.hasFieldErrors('username') }">
					<p style="font-weight:bold;color:red;text-align:left;padding:0;margin:0">
					<spring:message code="${errors.getFieldError('username').codes[0] }"
						text="${errors.getFieldError('username').defaultMessage }"/>
						</p>
				</c:if>
			</spring:hasBindErrors>
			
			<label class="block-label" for="id">아이디</label>
			<input type="hidden" name="idc" value="unchecked"/>
			<form:input path="id"  />
			<input id="btn-checkid" type="button" value="id 중복체크">
			<p id ="checkid-msg" class="form-error"></p>
			<img style="display: none" id="check-image" src="/resources/images/check.png"/>
			<p style="font-weight:bold;color:#f00;text-align:left;padding:0;margin:0">
			<form:errors path="id"/></p>
			&nbsp;
			
			
			<label class="block-label" for="password">패스워드</label>
			<input type="password" id="password" name="password"  value="" />

			<fieldset>
				<legend>약관동의</legend>
				<input id="agreeprov" type="checkbox" name="agreeProv" >
				<label class="l-float">서비스 약관에 동의합니다.</label>
			</fieldset>

			<input type="submit" value="가입하기" id="submit-button" disabled />
		
		</form:form>
	</div>

</body>

</html>