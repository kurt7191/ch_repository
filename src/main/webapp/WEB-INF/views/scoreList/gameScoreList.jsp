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
		/* $('#game').click(function() {
			var sendData = "c_id="+$(this).val();
			$.post('gameBuyInfo.do', sendData, function(msg) {
				$('#gameBuyInfo').html(msg);
			});
		}); */
		// 클릭하면 옆에 클릭한 게임의 리스트 뜨게
		//var value;
		$('a').click(function() {
			var sendData = "c_id="+$(this).attr('id');	// a태그의 아이디 값 
			$.post("gameScore.do", sendData, function(msg) {
				$('#scoreList').html(msg);
				/* alert($(msg).find("#yorn").html());
				value = $(msg).find("#yn").html();
				if(value == 1) { //equals(password)
					location.href = "enter.do";
				}else if(value == 0){
					return false;
				}else{
					return false;
				} */		
			});
		});		
	});
	
	
</script>
</head>
<body>
<div>
	<div align="left" style="float: left; margin-left: 3em;">
		<table id="single">		
			<tr><td width="80%"><a id="game1" class="myButton" style="width: 160px">순간반응속도 측정</a></td></tr>
			<tr><td width="80%"><a id="game2" class="myButton" style="width: 160px">버튼 누르기</a></td></tr>
			<tr><td width="80%"><a id="game3" class="myButton" style="width: 160px">단축키 입력하기</a></td></tr>
			<tr><td width="80%"><a id="game4" class="myButton" style="width: 160px">멀티겜1</a></td></tr>
			<tr><td width="80%"><a href="singleGame.do?c_id='game1'" class="myButton" style="width: 160px">멀티겜2</a></td></tr>
			<tr><td width="80%"><a href="myInfoUpdateForm.do" class="myButton" style="width: 160px">멀티겜3</a></td></tr>
		</table>
	</div>
	<div id="scoreList" align="left" style="float: left; margin-left: 3em;">
		
	</div>
</div>
</body>
</html>