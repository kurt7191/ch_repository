<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result>0 }">
<script type="text/javascript">
alert("회원가입 하셨습니다.")
location.href = "main.do"
</script>
</c:if>

<c:if test="${result==0 }">
<script type="text/javascript">
alert("입력에 실패하셨습니다.")
history.go(-1);
</script>
</c:if>

<c:if test="${result==-1 }">
<script type="text/javascript">
alert("아이디가 중복입니다.")
history.go(-1);
</script>
</c:if>



</body>
</html>