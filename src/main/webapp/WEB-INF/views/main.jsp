<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#main th{
		background-color: #c0c0c0;
		color: black;
	}
	#main td{
		background-color: white;
		text-align: left;
		color: black;
	}
	#main { width: 480px; 
			table-layout:fixed;
	}

</style>
<script type="text/javascript">
	$(function() {

		$('.clickInfo').click(function() {
			var sendData = "his_id="+$(this).attr('id');	// a태그의 아이디 값 
			$.post("hisInfo.do", sendData, function(msg) {
				$('#hisInfo').html(msg);

			});
		});		
	});
	
	
</script>
</head>
<body>
<c:if test="${empty id }">
<!-- 비로그인시 -->
<div>
	<div align="left" style="float: left; margin-left: 2em;">
	<table id="main">
		<caption>비로그인시 뜰 화면</caption>
		<tr><th>아이디</th><th>현황</th><th>정보</th></tr>
		<c:forEach var="list" items="${list }">
			<tr><td class="clickInfo" id="${list.m_id }">${list.m_id }</td><td><c:if test="${list.vsyn == 0}">대기중</c:if><c:if test="${list.vsyn == 1}">게임중</c:if></td><td>${list.intro }</td></tr>
		</c:forEach>
	</table>
	</div>
	<div id="hisInfo" align="left" style="float: left; margin-left: 3em;">
		 
	</div>
</div>
</c:if>

<c:if test="${not empty id }">
<!-- 로그인시 -->
<div>
	<div align="left" style="float: left; margin-left: 2em;">
	<table id="main">
		<caption>로그인시 뜰 화면</caption>
		<tr><th>아이디</th><th>현황</th><th>정보</th></tr>
		<c:forEach var="list" items="${list }">
			<tr><td class="clickInfo" id="${list.m_id }">${list.m_id }</td><td><c:if test="${list.vsyn == 0}">대기중</c:if><c:if test="${list.vsyn == 1}">게임중</c:if></td><td>${list.intro }</td>
		</c:forEach>
	</table>
	</div>
	<div id="hisInfo" align="left" style="float: left; margin-left: 3em;">
		
	</div>
</div>
</c:if>

</body>
</html>