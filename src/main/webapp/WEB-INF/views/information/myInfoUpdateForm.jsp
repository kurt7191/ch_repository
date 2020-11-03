<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.myInfoUpdate td{
		background-color: white;
		text-align: left;
	}
	.myInfoUpdate{ width: 650px; table-layout:fixed;}
	
	.myInfoUpdate caption{
		color: white;
	}
</style>
<script type="text/javascript">
	function chk() {
		if(frm.password.value != frm.password2.value) {
			alert("암호를 확인하세요.");
			frm.password.focus();
			frm.password.value="";
			frm.password2.value="";
			return false;
		}
		alert("정보 수정에 성공하셨습니다.");
	}
</script>
</head>
<body>
<form action="myInfoUpdate.do" method="post" name="frm" onsubmit="return chk()">
<table class="myInfoUpdate">                                                                   
	<caption>회원정보 수정</caption>
	<tr><th>암호</th><td colspan="2"><input type="password" name="password" required="required"></td></tr>
	<tr><th>암호확인</th><td colspan="2"><input type="password" name="password2" required="required"></td></tr>
	<tr><th>이메일</th><td colspan="2"><input type="email" name="email" required="required" value="${member.email }"></td></tr>
	<tr><th>이름</th><td colspan="2"><input type="text" name="name" required="required" value="${member.name }"></td></tr>
	<tr><th>생년월일(아이디찾기)</th><td colspan="2"><input type="text" name="birthday" required="required" value="${member.birthday }"></td></tr>
	<tr><th>졸업한 초등학교 이름(암호찾기)</th><td colspan="2"><input type="text" name="question" required="required" value="${member.question }"></td></tr>
	<tr><th>소개</th><td colspan="2"><input type="text" name="intro" required="required" value="${member.intro }"></td></tr>
	<tr><th colspan="3"><input type="submit" value="확인"><button onclick="location.href='enter.do'">메인으로</button></th></tr>
</table>
</form>
</body>
</html>