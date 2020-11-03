<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#single td{
		text-align: center;
	}
	#single { width: 480px; 
			table-layout:fixed;
	}

</style>
<script type="text/javascript">
	$(function() {
		$('button').click(function() {
			var sendData = "c_id="+$(this).val();
			$.post('gameBuyInfo.do', sendData, function(msg) {
				$('#gameBuyInfo').html(msg);
			});
		});
		
		var value;
		$('a').click(function() {
			var sendData = "c_id="+$(this).attr('id');	// a태그의 아이디 값 
			$.post("gameBuyMsg.do", sendData, function(msg) {
				//alert($(msg).find("#yn").html());
				alert($(msg).find("#yorn").html());
				value = $(msg).find("#yn").html();
				if(value == 1) { //equals(password)
					location.href = "enter.do";
				}else if(value == 0){
					return false;
				}else{
					return false;
				}		
			});
		});		
	});
	
	
</script>
</head>
<body>
<div>
	<div align="left" style="float: left; margin-left: 3em;">
		<table id="single">		
			<tr><td width="80%"><a id="game1" class="myButton" style="width: 160px">순간반응속도 측정</a></td><td><button id="game" value="game1">정보</button></td></tr>
			<tr><td width="80%"><a id="game2" class="myButton" style="width: 160px">버튼 누르기</a></td><td><button id="game" value="game2">정보</button></td></tr>
			<tr><td width="80%"><a id="game3" class="myButton" style="width: 160px">단축키 입력하기</a></td><td><button id="game" value="game3">정보</button></td></tr>
			<tr><td width="80%"><a id="game4" class="myButton" style="width: 160px">멀티게임test1</a></td><td><button id="game" value="game4">정보</button></td></tr>
			<tr><td width="80%"><a id="game5" class="myButton" style="width: 160px">멀티게임test2</a></td><td><button id="game" value="game5">정보</button></td></tr>
			<tr><td width="80%"><a id="game6" class="myButton" style="width: 160px">멀티게임test3</a></td><td><button id="game" value="game6">정보</button></td></tr>
		</table>
	</div>
	<div id="gameBuyInfo" align="left" style="float: left; margin-left: 3em;">
		
	</div>
</div>
</body>
</html>