<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="yorn">
	<c:if test="${result == 1  }">
		${m_id }님 로그인 성공하셨습니다.
	</c:if>
	<c:if test="${result == 2  }">
		이미 접속중입니다. 기존의 접속을 종료하시겠습니까?
	</c:if>
	<c:if test="${result == 0 }">
		암호가 틀렸습니다.
	</c:if>
	<c:if test="${result == -1 }">
		아이디가 없습니다.
	</c:if>
</div>
<div id="yn">
${result}
</div>
</body>
</html>