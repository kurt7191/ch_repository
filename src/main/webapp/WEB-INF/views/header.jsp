<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.logo {
	    width: auto; height: auto;
	    max-width: 230px;
	    max-height: 130px;
	}
</style>
</head>
<body>
	<table style="width:100%;">
		<tr><td rowspan="3" width="20%"><a href="start.do"><img class="logo" alt="" src="images/logo.png"></a></td><td rowspan="2" width="60%"><h1>프로젝트 명</h1></td><td>접속자수 (<font color="red" size="2">${usercount }  </font>)<a href="" class="connectList">접속자 명단 보기</a></td></tr>
		<tr><td><c:if test="${empty id }"><a href="joinForm.do" class="myButton">회원가입</a></c:if><c:if test="${not empty id }"><a href="myInfoUpdateForm.do" class="myButton">회원정보수정</a></c:if></td></tr>
		<tr><td><c:if test="${empty id }"> 더 많은 기능을 즐기시려면 로그인하세요.</c:if><c:if test="${not empty id }"><div align="left" style="float: left; margin-left: 3em;"><img alt="" src="images/coin.png" style="width: 20px; height: 20px">${ss_coin }</div><div align="left" style="float: left; margin-left: 3em;"><img alt="" src="images/heart.png" style="width: 20px; height: 20px"> ${ss_heart }</div><div align="right"><font size="3" color="red">${id }</font>님 반갑습니다.</div></c:if></td><td><c:if test="${empty id }"><a href="loginForm.do" class="myButton">로그인</a></c:if><c:if test="${not empty id }"><a href="logout.do" class="myButton">로그아웃</a></c:if></td></tr>
	</table>
</body>
</html>