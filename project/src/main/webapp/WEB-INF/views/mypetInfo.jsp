<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class = "container"><h2>나의 펫 정보</h2></div>
<div>
<table class = "table table-striped">
<tr><td>펫 넘버 : </td><td>${pet.petNumber }</td></tr>
<tr><td>펫 이름 : </td><td>${pet.petName }</td></tr>
<tr><td>펫 성별 : </td><td>${pet.petSex }</td></tr>
<tr><td>펫 종류 : </td><td>${pet.petType }</td></tr>
<tr><td>펫 나이 : </td><td>${pet.petAge }</td></tr>
</table>
</div>

</body>
</html>