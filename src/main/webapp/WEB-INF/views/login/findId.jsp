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
	<c:if test="${not empty m_id}">
		찾으시는 아이디는 ${m_id }입니다.
	</c:if>
	<c:if test="${empty m_id}">
		${name }님은 가입되어있지 않습니다.
		질문의 답변이 정확한지 확인하세요.
		새로운 계정을 생성하세요.
	</c:if>
</div>
</body>
</html>