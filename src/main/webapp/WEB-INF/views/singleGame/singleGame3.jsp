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
<style type="text/css">
	.rule { position:absolute; width: 50em; height: 30em; opacity: 1; background-color: yellow;}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	var buttonNum = -1;
	var time = 0;
	var sDate=0, eDate=0;
	var starcraftEnd = 90; // 스타크래프트 이미지 수
	var ran = 0;
	var keySave = 0;
	var audio;
	audio = new Audio("sound/gamesound3.mp3");	//키면 음악 실행
    audio.volume = 0.5;
    audio.loop = true;
    audio.play();
	$(function() {
		$('.rule').click(function() {
			$(this).remove();
			$('input').select();
			sDate = new Date().getTime();
			aaa();			
		});
	});
	
	function aaa() {
		if(buttonNum < 9) {
			buttonNum++;
			$.getJSON("starcraft.json", function(data) {
				ran = Math.floor(Math.random()*starcraftEnd);
				//$('#test').append(ran);
				$.each(data, function() {
					if(this.id == ran) {
						$('#tableTree').append("<img src='starcraftImg/"+this.name+".jpg'>");
						//$('#test').append(this.key+" ");
						keySave = this.key;
						//$('#test').append(keySave);
						bbb();
					}
				});
			});
		} else {
			eDate = new Date().getTime();
			time = (eDate - sDate);
			location.href = "singleGameResult.do?time="+time;
		}
	}
	
	function bbb() {
		$('input').keyup(function() {	//keyup : 키를 눌렀다 뗄때
			var value = $(this).val();
			//$('#test').append(value);
			if(keySave == value) {
				$('img').remove();
				$('input').val("");
				aaa();
			}
			$('input').val("");
		});
	}
</script>
</head>
<body>
	<div class="rule" align="center">
		<font size="3" color="blue">랜덤으로 나오는 스타크래프트 유닛과 건물의 단축키를 입력하세요.</font><p>
		<font size="3" color="blue">클릭하면 시작!!</font>
	</div>
	<div id="tableTree" align="center" style = 'padding: 100px'>
	</div>
	<div id="test"></div>
	<div align="center">
		<input type="text" value="" size="1">
	</div>
</body>
</html>