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
	#gameScore td{
		text-align: center;
	}
	#gameScore { width: 400px; 
			table-layout:fixed;
	}

</style>
</head>
<body>
<div>
	<table id="gameScore">
		<caption>${c_id } 랭킹</caption>
		<tr><th>순위</th><td>아이디</td><td>평균점수</td><td>최고점수</td><td>플레이횟수</td></tr>
		<c:forEach var="scoretable" items="${slist }">
		<c:set var="rank" value="${rank + 1 }"></c:set>
			<tr><th>${rank }</th><td>${scoretable.m_id }</td><td>${scoretable.scoreAve }</td><td>${scoretable.highScore }</td><td>${scoretable.scoreCnt }</td></tr>
		</c:forEach>
	</table>
</div>
</body>
</html>