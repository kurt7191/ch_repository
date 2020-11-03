<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#multy td{
		text-align: center;
	}
	#multy { width: 480px; 
			table-layout:fixed;
	}

</style>
<script type="text/javascript">
	$(function() {
		$('button').click(function() {
			var sendData = "c_id="+$(this).val();
			$.post('gameInfo.do', sendData, function(msg) {
				$('#gameInfo').html(msg);
			});
		});
		
		var value;
		$('a').click(function() {
			var sendData = "c_id="+$(this).attr('id');	// a태그의 아이디 값 
			$.post("multyGameMsg.do", sendData, function(msg) {
				//alert($(msg).find("#yn").html());
				alert($(msg).find("#yorn").html());
				value = $(msg).find("#yn").html();
				if(value == 1) { //equals(password)
					location.href = "matchWith.do";	// 웹소켓 접속 목록 리스트 페이지
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
		<table id="multy">		
			<tr><td width="80%"><a id="game4" class="myButton" style="width: 160px">멀티겜test1</a></td><td><button id="game" value="game4">정보</button></td></tr>
			<tr><td width="80%"><a id="game5" class="myButton" style="width: 160px">멀티겜test2</a></td><td><button id="game" value="game5">정보</button></td></tr>
			<tr><td width="80%"><a id="game6" class="myButton" style="width: 160px">멀티겜test3</a></td><td><button id="game" value="game6">정보</button></td></tr>
		</table>
	</div>
	<div id="gameInfo" align="left" style="float: left; margin-left: 3em;">
		
	</div>
</div>
</body>
</html>