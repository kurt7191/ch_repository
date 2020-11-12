<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            <li><a href="PBview.do">기기구매</a></li>
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
   <!-- 마이페이지 body의 네비게이션 -->
	<div><h2 class="text-primary" align="center">회원 정보</h2></div>
	<div class = "container" align = "center">
	<nav class="navbar navbar-expand sm bg-light">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="myinfo.do">회원 정보</a></li>
<li class = "nav-item"><a class = "nav-link" href = "insertPetInfo.do">펫 정보 입력</a></li>
<li class = "nav-item"><a class = "nav-link" href = "orderInfo.do">나의 주문 정보</a></li>
		</ul>
	</nav>
	</div>
	
</body>
</html>