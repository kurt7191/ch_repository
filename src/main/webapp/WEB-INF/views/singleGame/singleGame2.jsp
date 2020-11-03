<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${path }/css/comm.css?ver=1" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<style type="text/css">
	/* body { background: #5e87b0; } */
	.rule { position:absolute; width: 900px; height: 30em; opacity: 1; background-color: yellow;}
	/* button { position:absolute;  width: 5em; height: 5em; opacity: 0; background-color: green;  visibility: hidden; } */
	.on { opacity: 1; visibility: visible; }
	.container {	
		width: 100%;	height: 100%; */
	}
	button {
	 	position:absolute; opacity: 0; visibility: hidden;
		-moz-box-shadow:inset 0px 1px 0px 0px #cf866c;
		-webkit-box-shadow:inset 0px 1px 0px 0px #cf866c;
		box-shadow:inset 0px 1px 0px 0px #cf866c;
		background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #d0451b), color-stop(1, #bc3315));
		background:-moz-linear-gradient(top, #d0451b 5%, #bc3315 100%);
		background:-webkit-linear-gradient(top, #d0451b 5%, #bc3315 100%);
		background:-o-linear-gradient(top, #d0451b 5%, #bc3315 100%);
		background:-ms-linear-gradient(top, #d0451b 5%, #bc3315 100%);
		background:linear-gradient(to bottom, #d0451b 5%, #bc3315 100%);
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d0451b', endColorstr='#bc3315',GradientType=0);
		background-color:#d0451b;
		-moz-border-radius:3px;
		-webkit-border-radius:3px;
		border-radius:3px;
		border:1px solid #942911;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:13px;
		padding:6px 24px;
		text-decoration:none;
		text-shadow:0px 1px 0px #854629;
		width: 90px;
	}
	.btn:hover {
		background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #bc3315), color-stop(1, #d0451b));
		background:-moz-linear-gradient(top, #bc3315 5%, #d0451b 100%);
		background:-webkit-linear-gradient(top, #bc3315 5%, #d0451b 100%);
		background:-o-linear-gradient(top, #bc3315 5%, #d0451b 100%);
		background:-ms-linear-gradient(top, #bc3315 5%, #d0451b 100%);
		background:linear-gradient(to bottom, #bc3315 5%, #d0451b 100%);
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#bc3315', endColorstr='#d0451b',GradientType=0);
		background-color:#bc3315;
	}
	.btn:active {
		/* position:relative; */
		position:absolute;
		top:1px;
	}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	var backsound;
	window.onkeydown = function() {
		var kcode = event.keyCode;
		if(kcode == 32) event.returnValue = false;
	}
	backsound = new Audio("sound/gamesound2.mp3");	//키면 음악 실행
	backsound.volume = 0.5;
	backsound.loop = true;
	backsound.play();
	var buttonNum = -1;
	//setInterval(onTimer, 1000);
	var wc = Math.random()*600;
	var hc = Math.random()*500;
	var resDate = 0;
	var sDate=0, eDate=0;
	var audio;
	var backsound;
	$(function() {
		$('.rule').click(function() {
			$(this).remove();
			sDate = new Date().getTime();
			onTimer();
			
		});
		//onTimer();
		//changeItem(buttonNum);
	});
	
	function onTimer() {
		if(buttonNum < 9) {
			buttonNum++;
		} else {
			eDate = new Date().getTime();
			time = (eDate - sDate);
			location.href = "singleGameResult.do?time="+time;
		}
		wc = Math.random()*600;
		hc = Math.random()*500;
		changeItem(buttonNum);
	}
	
	function changeItem(arg) {
		$(".btn").removeClass("on");
		var selector = "#button" + arg;
		$(selector).offset({top: hc, left: wc});
		$(selector).addClass("on");
		$(selector).click(function() {
			onTimer();
			audio = new Audio("sound/btn1.mp3");	//키면 음악 실행
		    audio.volume = 0.5;
		    audio.play();
		});
	}
	
</script>
</head>
<body onkeypress="return false;">
<div class="container">
	<div class="rule" align="center">
		<font size="3" color="blue">랜덤한 위치에 나타나는 10개의 버튼을 클릭하세요. 반응속도를 측정하겠습니다.</font><p>
		<font size="3" color="blue">클릭하면 시작!!</font>
	</div>
	<button class="btn" id="button0">눌러</button>
	<button class="btn" id="button1">click</button>
	<button class="btn" id="button2">눌러</button>
	<button class="btn" id="button3">click</button>
	<button class="btn" id="button4">눌러</button>
	<button class="btn" id="button5">click</button>
	<button class="btn" id="button6">눌러</button>
	<button class="btn" id="button7">click</button>
	<button class="btn" id="button8">click</button>
	<button class="btn" id="button9">마지막</button>
</div>
</body>
</html>