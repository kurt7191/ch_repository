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
<script type="text/javascript">
	var sDate=0, eDate=0;
	var audio;
	//var resDate = (eDate - sDate) * 1000;
	function init() {
		audio = new Audio("sound/gamesound1.mp3");	//키면 음악 실행
	    audio.volume = 0.5;
	    audio.loop = true;
	    audio.play();
		//var play = document.getElementById("play");
		//var stop = document.getElementById("stop")
		//play.addEventListener("click",playData);  //play 버튼 눌렀을때 이벤트 처리
		//stop.addEventListener("mousedown",stopData); //stop 버튼 눌렀을때 이벤트 처리
		//showData(); //함수 실행
	}
	
	/* function showData() {
		
	} */

	
	function playData() {
		var tr = Math.random()*5000;
		var btn = document.getElementById('play');
		document.getElementById("play").disabled = true;
		setTimeout(fu, tr);
		function fu() {
			//location.href = "test1.jsp?col=red&sDate="+sDate;
			$('div').css('background', 'yellow');
			//document.bgColor = "red";
			sDate = new Date().getTime();
		}
	}
	
	 function stopData() {
		eDate = new Date().getTime();
		var time = (eDate - sDate);
		if(sDate == 0) {
			//var id = document.getElementById("id").value;
			//var resDate1 = resDate/1000;
			//var resDate2 = resDate1 - resDate;
			//location.href = "b.jsp?resDate1="+resDate1"&resDate2="+resDate2";
			location.href = "game1Err1.do";
		} else {
			//alert("정지");
			//location.href = "../a.jsp?resDate="+resDate;
			//var m_id = document.getElementById("m_id").value;
			location.href = "singleGameResult.do?time="+time;
		}
	} 
</script>
</head>
<body onload="init()">
<div align="center">
	<div id="sg1" align="center" style="float: none; margin-left: 3em; width: 800px; height: 500px;">
		
	</div>
	<div align="center" style="clear: left; margin-left: 3em; width: 200px; height: 50px; vertical-align: middle;">
		<button id="play" onclick="playData()" class="myButton">start</button>
		<button id="stop" onclick="stopData()" class="myButton">stop</button>
		start를 누른 후 배경이 바뀌면 stop을 누르세요
	</div>
</div>
</body>
</html>