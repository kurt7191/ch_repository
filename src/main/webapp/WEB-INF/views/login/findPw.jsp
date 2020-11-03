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
	<c:if test="${result == 1}">
		찾으시는 암호를 ${m_id }님의 가입한 메일로 전송했습니다.
	</c:if>
	<c:if test="${result == 0}">
		${m_id }님의 질문에 대한 답변이 다릅니다.
	</c:if>
	<c:if test="${result == -1}">
		${m_id }님은 가입되어있지 않습니다.
	</c:if>
</div>
</body>
</html>