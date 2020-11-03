<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#hisInfo td{
		text-align: center;
	}
	#hisInfo { width: 400px; 
			table-layout:fixed;
	}

</style>
</head>
<body>
<div>
	<table id="hisInfo">
		<caption>${member.m_id } 정보</caption>
		<tr><th colspan="2">소개</th><th colspan="2">${member.intro }</th></tr>
		<tr><th>게임명</th><th>순위</th><th>최고기록</th><th>플레이횟수</th></tr>
		<c:forEach var="scoretable" items="${hisRank }">
			<tr><td>${scoretable.c_id }</td><td>${scoretable.rank }</td><td>${scoretable.highScore }</td><td>${scoretable.scoreCnt }</td></tr>
		</c:forEach>
	</table>
</div>
</body>
</html>