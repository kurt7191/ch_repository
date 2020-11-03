<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body id="m">
<!-- 
	<a href="home.do" class="myButton">버튼형식으로 할지 메뉴형식으로 할지</a><a href="first.do" class="myButton">ex메뉴1..</a><a href="second.do" class="myButton">ex메뉴2..</a><a href="game.do" class="myButton">ex메뉴3..</a>
	 -->
	<nav id="topMenu" >
		<ul>
			<li><a class="menuLink" href="singleGameList.do">싱글게임</a></li>
			<li>|</li>
			<li><a class="menuLink" href="multyGameList.do">멀티게임</a></li>
			<li>|</li>
			<li><a class="menuLink" href="gameScoreList.do">게임순위</a></li>
			<li>|</li>
			<li><a class="menuLink" href="gameBuyList.do">게임구매</a></li>
			<li>|</li>
			<li><a class="menuLink" href="start.do">게시판or쪽지함(x)</a></li>
			<li>|</li>
			<li><a class="menuLink" href="waitRoom.do">대기방</a></li>
		</ul>
	</nav>
</body>
</html>