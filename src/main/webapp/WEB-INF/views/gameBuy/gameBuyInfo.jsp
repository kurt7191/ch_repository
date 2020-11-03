<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#singleInfo td{
		text-align: center;
	}
	#singleInfo { width: 400px; 
			table-layout:fixed;
	}

</style>
</head>
<body>
<div>
	<table id="singleInfo">
		<tr><th>게임명</th><td colspan="2">${contents.c_name }</td></tr>
		<tr><th>설명</th><td colspan="2">${contents.information }</td></tr>
		<tr><th>사용자 수</th><td colspan="2">${contents.people }</td></tr>
		<tr><th>구입가격</th><td colspan="2">${contents.c_coin }</td></tr>
		<tr><th>1등 정보</th><th>평균기록</th><th>플레이 횟수</th></tr>
		<tr><td>${rankOne.m_id }</td><td>${rankOne.scoreAve }</td><td>${rankOne.scoreCnt }</td></tr>
	</table>
</div>
</body>
</html>