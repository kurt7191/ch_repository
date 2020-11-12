<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
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
<script type="text/javascript">
function idchk() {
	if(!frm.c_id.value){
		alert('아이디를 입력해주세요!')
		frm.c_id.focus(); return false;
	}
	$.post('idChk.do', 'id='+frm.c_id.value, function(data) {
		$('#disp').html(data);
	})
	
}
	
</script>
</head>
<body>
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
            <li><a href="">마이페이지</a></li>
            <li><a href="">회원가입</a></li>
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

	<!-- 회원가입 body -->
	<h2 class="text-primary" align = "center">회원 가입</h2>
	<div class="container" align="center">
		<form action="join.do" method="post" name="frm" enctype="multipart/form-data" onsubmit = "return chk()">
			<table class="table table-hover">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="c_id" required="required"
						autofocus="autofocus"><input type = "button" onclick = "idchk()" value = "중복체크">
						<div id = "disp" class = "err"></div></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" required="required"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" required="required"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" name="sex" required="required"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" required="required"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" required="required"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phoneNumber" required="required"></td>
				</tr>
				<tr><td colspan = "2" align = "center"><input type = "submit"></td></tr>
			</table>
			<a href="loginForm.do">로그인</a>
		</form>
	</div>

</body>
</html>