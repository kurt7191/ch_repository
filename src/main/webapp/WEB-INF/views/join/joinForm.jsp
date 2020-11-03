<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
	.join td{
		background-color: white;
		text-align: left;
	}
	.join{ width: 650px; table-layout:fixed;}
	
</style>
<script type="text/javascript">
	$(function() {
		$('input:button').click(function() {
			var sendData = "m_id="+$('#m_id').val();
			$.post("confirm.do", sendData, function(msg) {
				alert($(msg).find("#yorn").html());
			});
			return false;
		});
	});
	
	function chk() {
		if(frm.password.value != frm.password2.value) {
			alert("암호를 확인하세요.");
			frm.password.focus();
			frm.password.value="";
			frm.password2.value="";
			return false;
		}
		alert("회원가입에 성공하셨습니다. 로그인하세요!");
	}
</script>
</head>
<body>
<form action="join.do" method="post" name="frm" onsubmit="return chk()">
<table class="join">                                                                   
	<caption>회원가입</caption>
	<tr><th>아이디</th><td style="size: 30em;"><input type="text" name="m_id" id="m_id" required="required"></td>
					 <td><input type="button" value="중복체크" onclick="confirmId()"></td></tr>
	<tr><th>암호</th><td colspan="2"><input type="password" name="password" required="required"></td></tr>
	<tr><th>암호확인</th><td colspan="2"><input type="password" name="password2" required="required"></td></tr>
	<tr><th>이메일</th><td colspan="2"><input type="email" name="email" required="required"><font size="2">아이디, 암호 찾을때 발송받을 메일입니다.</font></td></tr>
	<tr><th>이름</th><td colspan="2"><input type="text" name="name" required="required"><font size="2">본명으로 입력해주세요.</font></td></tr>
	<tr><th>생년월일(아이디찾기)</th><td colspan="2"><input type="text" name="birthday" required="required" ><font size="2">아이디 찾을때 사용될수 있습니다.</font></td></tr>
	<tr><th>졸업한 초등학교 이름(암호찾기)</th><td colspan="2"><input type="text" name="question" required="required"><font size="2">암호 찾을때 사용될수 있습니다.</font></td></tr>
	<tr><th>소개</th><td colspan="2"><input type="text" name="intro" required="required" ></td></tr>
	<tr><th colspan="3"><input type="submit" value="확인"></th>
</table>
</form>
</body>
</html>