<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>
ul{
   background-color : #FFDAB9;
   width:1000px;
   margin:auto;
   padding : 0;
   overflow: hidden;
   list-style-type : none;
}
li { 
float:left; 
}
li a {
   display:block;
   background-color : #FFDAB9;
   color:#000000;
   padding : 30px;
    padding-right:45px;
   padding-left: 45px;
   text-decoration:none;
   text-align:center;
   font-weight:bold;
}
/* li a:hover {
   background-color : #CD853F;
   color : white;
} */
li a.current {
   background-color: #FF6347;
   color : white;
}
li a:hover:not(.current) {
   background-color: #CD853F;
   color : white;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
<!-- 로고창 -->

	<div class="container" align = "center">
		<a href="main.do"><img src="resources/images/logo.jpg" width="212px"></a>
	</div>
<!--네비게이션 바 -->
   <div class ="container" align="center"> 
         <!-- Links -->
         <ul>
            <li><a href="main.do">Home</a></li>
            <li><a href="PBview">기기구매</a></li>
            <li><a href="">게시판</a></li>
            <li><a href="">고객센터</a></li>
            <li><a href="mypage.do">마이페이지</a></li>
            <li><a href="joinForm.do">회원가입</a></li>
            <li><c:choose>
                  <c:when test="${not empty cId }">
                     <a href="logout.do">로그아읏</a>
                  </c:when>
                  <c:when test="${empty cId}">
                     <a href="loginForm.do">로그인</a>
                  </c:when>
               </c:choose></li>
         </ul>
   </div>
   <!-- 펫 정보 입력 body -->
<h2 class = "text-primary" align = "center">펫 정보 입력하기</h2>
<div class = "container">
<form action = "insertPetInfo2.do" method = "post">
<table class = "table table-striped">
<tr><td>펫 번호</td><td><input type = "text" name = "petNumber" autofocus="autofocus" required="required"></td></tr>
<tr><td>펫 이름</td><td><input type = "text" name = "pet_name" required="required"></td></tr>
<tr><td>펫 성별</td><td><input type = "text" name = "pet_sex" required="required"></td></tr>
<tr><td>펫 유형</td><td><input type = "text" name = "pet_type" required="required"></td></tr>
<tr><td>펫 나이</td><td><input type = "number" name = "pet_age" required="required"></td></tr>
<tr><td><input type = "submit" value = "입력" ></td></tr>
</table>
</form></div>


</body>
</html>