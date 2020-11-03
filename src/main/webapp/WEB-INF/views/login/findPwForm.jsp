<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.findPw td{
		background-color: white;
		text-align: left;
	}
	.findPw{ width: 400px; }
</style>
<script type="text/javascript">	
	$(function() {
		var value;
		$('input:button').click(function() {
			var sendData = "m_id="+$('#m_id').val()+"&question="+$('#question').val();
			$.post("findPw.do", sendData, function(msg) {
				alert($(msg).find("#yorn").html());			
			});
		});	
	});

</script>
</head>
<body>
<table class="findPw">
	<caption>암호 찾기</caption>
	<tr><th>질문</th><td>당신의 아이디를 입력하세요.</td></tr>
	<tr><th>답변</th><td><input type="text" name="m_id"  id="m_id" required="required"></td></tr>
	<tr><th>질문</th><td>졸업한 초등학교 이름은?</td></tr>
	<tr><th>답변</th><td><input type="text" name="question"  id="question" required="required"></td></tr>
	<tr><th colspan="2"><input type="button" value="확인"></th></tr>
	<tr><th colspan="2"><a href="loginForm.do" class="myButton">로그인</a><a href="joinForm.do" class="myButton">회원가입</a></th></tr>
</table>
</body>
</html>