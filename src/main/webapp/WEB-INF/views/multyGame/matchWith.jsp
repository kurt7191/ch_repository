<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//웹 소켓 변수 
	var websock; 
	// 문서가 시작하자 마자 호출되는 메소드 
	$(document).ready(function(){ 
		// message라는 id를 가진 영역에서 Enter를 치면 send라는 메소드 호출 
		$('#message').keypress(function(event){ 
			// 누른 키보드 값 가져오기 
			var keycode=event.keyCode?event.keyCode:event.which; 
			if (keycode==13) {
				send(); // 누른 키가 엔터이면 send()호출 
			}
			event.stopPropagation(); // 이벤트 전달을 하지 않음 
		}); 
		// 전송과 입장 및 퇴장 버튼을 눌렀을 때 메소드를 호출하도록 설정 
		//채팅 전송
		$('#sendBtn').click(function(){ 
			send(); 
		}); 
		//접속자 리스트
		$('#viewBtn').click(function(){ 
			connectList(); 
		}); 
		//채팅 로그 삭제
		$('#chatDel').click(function(){ 
			$('#chatMessageArea').empty();
		}); 
		//입장
		$('#enterBtn').click(function(){ 
			connect(); 
		}); 
		//퇴장
		$('#exitBtn').click(function(){ 
			disconnect(); 
		});
		
		$('span').click(function() {
			alert("11");
 			var awayId = $(this).attr('id');
			alert("aa");
			matchSend(awayId);
			/* 
			var msg = {
				what: "match",
				id: $('#id').val()
			};
			// Send the msg object as a JSON-formatted string.
			websock.send(JSON.stringify(msg));*/
		});
	});
	
	// 메시지를 출력하는 메소드 
	function appendMessage(msg){ 
		// msg를 chatMessageArea에 추가
		$('#chatMessageArea').append(msg+'<br>'); 
		//스크롤 바를 만들기 
		var chatAreaheight=$('#chatArea').height();
		var maxscroll=$('#chatMessageArea').height()-chatAreaheight; 
		$('#chatArea').scrollTop(maxscroll); 
	}
	
	function listView(msg){ 
		// msg를 chatMessageArea에 추가
		$('#listViewArea').empty();
		alert(msg);
		$('#listViewArea').append(msg); // append 이부분 딴걸로 바꾸던가 해야할듯 
		//스크롤 바를 만들기 
		/* var chatAreaheight=$('#listArea').height();
		var maxscroll=$('#listViewArea').height()-chatAreaheight; 
		$('#listArea').scrollTop(maxscroll);  */
	}
	
	// waitRoom 켜지면 웹소켓에 연결될 메소드 
	function connect(){ 
		var ids = "id="+$('#m_id').val();
		websock=new WebSocket("ws://192.168.40.133:8181/project1/chat-ws.do?"+ids); 
		websock.onopen=onOpen; // 연결이 될 때 호출될 메소드 설정 
		websock.onmessage=onMessage; // 메시지가 왔을 때 호출될 메소드 설정 
		websock.onclose=onClose; // 연결이 해제될 때 호출될 메소드 설정 
		//websock.send("list");	//접속자 명단 가지고 오기위해 서버에 보내는 메세지
	} 
	
	// 퇴장 버튼을 눌렀을 때 호출될 메소드 
	function disconnect(){ 
		// 소켓 닫기 
		websock.close(); 
	}
	
	function onOpen(event){ // 연결이 되었을 때 호출될 메소드 
		appendMessage("연결되었습니다.");
		connectList();
	} 
	
	function onMessage(event){//메시지가 왔을 때 호출될 메소드(텍스트를 json 형식으로 바꾸기) 
		//var data=event.data; 
		var js = JSON.parse(event.data);
		// 접속자 명단 출력
		//var obj = eval("("+data+")");	//json 형태의 텍스트 받아오기
		if(js.what == 'list') {
			listView(js.text);
		}else if(js.what == 'chat'){
			appendMessage(js.text);
		}
		//appendMessage(obj.text);
		//메세지 왔을때 여기서 이벤트처리 다른페이지 이동이나 테이블 띄우던가 버튼띄우던가 등등
	} 
	
	function onClose(event) { // 연결이 해제될 때 호출되는 메소드 
		appendMessage("연결을 끊었습니다."); 
	} 
	
	//접속자 목록 보기
	function connectList(){ 
		var msg = {
			what: "list"
		};
		// Send the msg object as a JSON-formatted string.
		websock.send(JSON.stringify(msg));
		//websock.send("list");
	}
	
	//대결창 보내기
	function matchSend(val){ 
		alert("bb");
		var msg = {
			what: "match",
			awayId: val,
			c_id: $('#c_id').val(),
		};
		// Send the msg object as a JSON-formatted string.
		websock.send(JSON.stringify(msg));
		//appendMessage("초대수락 대기중");
		$('#listViewArea2').empty();
		$('#listViewArea2').append("<h2>초대수락 대기중<h2>"); 
	}
	
	// 전송 버튼을 눌렀을 때 호출되는 메소드 
	function send(){ 
		// jQuery로 쓸 때 코드 
		//var nickname=$('#nickname').val(); 
		var msg=$('#message').val(); 
		websock.send(msg);
		//ex : websock.send("vsss:"+nickname+":"+msg);
		//vsss 이부분 웹소켓에서 읽어서 vsss이면 뒤에 오는 텍스트를 아이디로 읽어서 그 텍스트에게만 무엇인가전달하게
		
		//appendMessage(nickname+":"+msg); 
		$('#message').val(""); 
	}
	
</script>
</head>
<body onload="connect()">
<div>
	<h1>${c_id }</h1>
	대결 상대를 선택하세요.
</div>
<input type="hidden" id="m_id" value="${m_id }">
<input type="hidden" id="c_id" value="${c_id }">
<div>
	<div align="left" style="float: left; margin-left: 3em; overflow-y:auto; overflow-x:hidden; height:350px;">
		<h1>접속자 명단 뜰곳</h1>
		<input type="button" id="viewBtn" value="접속자 보기" />
		<div id="listArea">
			<div id="listViewArea"></div>
		</div>
	</div>
	<div align="left" style="float: left; margin-left: 3em; overflow-y:auto; overflow-x:hidden; height:350px;">
		<div id="listArea2">
			<div id="listViewArea2"></div>
		</div>
		<!-- 별명 : <input type="text" id="nickname" />
		<input type="button" id="enterBtn" value="입장" />
		<input type="button" id="exitBtn" value="퇴장" />
		<h1>대화영역</h1>
		<div id="chatArea">
			<div id="chatMessageArea"></div>
		</div>
		<br>
		<input type="text" id="message" />
		<input type="button" id="sendBtn" value="전송" />
		<input type="button" id="chatDel" value="로그삭제" />
		<input type="button" id="sendBtn" value="전송" />
		<button onclick="location.href='gg.do'">클릭</button> -->
	</div>
</div>
</body>
</html>