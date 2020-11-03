<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<style type="text/css">
	.login td{
		background-color: white;
		text-align: left;
	}
	.login{ width: 400px; }
</style>
<script type="text/javascript">	
	$(function() {
		var value;
		$('input:button').click(function() {
			var sendData = "m_id="+$('#m_id').val()+"&password="+$('#password').val();
			$.post("login.do", sendData, function(msg) {
				//alert($(msg).find("#yn").html());
				alert($(msg).find("#yorn").html());
				value = $(msg).find("#yn").html();
				if(value == 1) { //equals(password)
					location.href = "enter.do";
				}else if(value == 2){
					location.href = "disconnect.do";
				}else if(value == 0){
					return false;
				}else{
					return false;
				}		
			});
		});	
	});

</script>
</head>
<body>
<form>
<table class="login">
	<caption>로그인</caption>
	<tr><th>아이디</th><td><input type="text" name="m_id" id="m_id" required="required"></td></tr>
	<tr><th>암호</th><td><input type="password" name="password"  id="password" required="required"></td></tr>
	<tr><th colspan="2"><input type="button" value="확인"></th></tr>
	<tr><th colspan="2"><a href="findIdForm.do" class="myButton">아이디 찾기</a><a href="findPwForm.do" class="myButton">패스워드 찾기</a></th></tr>
</table>
</form>
</body>
</html>