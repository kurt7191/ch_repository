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
	<c:if test="${result > 0 }">
		${m_id }는 사용 불가능한 아이디입니다.
		다른 아이디를 사용하세요.
	</c:if>
	<c:if test="${result == 0 }">
		${m_id }는 사용가능한 아이디입니다.
	</c:if>
</div>
</body>
</html>