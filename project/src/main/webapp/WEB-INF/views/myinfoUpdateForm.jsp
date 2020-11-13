<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 class="text-primary" align="center">회원 정보 수정</h2>
	<div class="container" align="center">
		<form action="myinfoUpdate.do" method="post" name="frm"
			enctype="multipart/form-data">
			<input type ="hidden" name = "id" value = "${member.id }">
			<table class="table table-hover">
			
				<tr>
					<td>아이디</td>
					<td>${member.id }</td>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" required="required"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" required="required"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" name="sex" required="required"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" required="required"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" required="required">@<input type = "text" name = "email" required="required"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phoneNumber" required="required" size = "4">-<input type="text" name="phoneNumber" required="required" size = "4">-<input type="text" name="phoneNumber" required="required" size = "4"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"></td>
				</tr>
			</table>
			<a href="loginForm.do">로그인</a>
		</form>
	</div>



</body>
</html>