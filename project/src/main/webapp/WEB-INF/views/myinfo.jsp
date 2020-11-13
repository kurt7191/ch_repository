<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul {
	background-color: #FFDAB9;
	width: 1000px;
	margin: auto;
	padding: 0;
	overflow: hidden;
	list-style-type: none;
}

li {
	float: left;
}

li a {
	display: block;
	background-color: #FFDAB9;
	color: #000000;
	padding: 30px;
	padding-right: 45px;
	padding-left: 45px;
	text-decoration: none;
	text-align: center;
	font-weight: bold;
}
/* li a:hover {
   background-color : #CD853F;
   color : white;
} */
li a.current {
	background-color: #FF6347;
	color: white;
}
li
 
a
:hover
:not
 
(
.current
 
)
{
background-color
:
 
#CD853F
;

	
color
:
 
white
;


}
</style>
<script type="text/javascript">
	function delChk() {
		var chk = confirm("정말 탈퇴하시겠습니까?");
		if (chk) {
			location.href = "myinfoDelete.do";
		} else
			alert('탈퇴 취소되었습니다.');
	}
</script>
<script type="text/javascript">
	function sessionChk() {
		alert('로그인을 해주세요.');
	}
	function alreadyLogin() {
		alert('이미 로그인 되어 있습니다.')
	}
</script>
</head>
<body>
	<!-- 로고창 -->

	<div class="container" align="center">
		<a href="main.do"><img src="resources/images/logo.jpg"
			width="212px"></a>
	</div>
	<!-- 네비게이션바 -->
	<div class="container" align="center">
		<!-- Links -->
		<ul>
			<li><a href="main.do">Home</a></li>
			<li><a href="PBview.do">기기구매</a></li>
			<li><a href="">게시판</a></li>
			<li><a href="">고객센터</a></li>
			<li><c:choose>
					<c:when test="${not empty cId }">
						<a href="mypage.do">마이페이지</a>
					</c:when>
					<c:when test="${empty cId }">
						<a onclick="sessionChk()" href="loginForm.do">마이페이지</a>
					</c:when>
				</c:choose></li>
			<!-- <li><a href="mypage.do">마이페이지</a></li> -->
			<li><c:choose>
					<c:when test="${empty cId }">
						<a href="joinForm.do">회원가입</a>
					</c:when>
					<c:when test="${not empty cId }">
						<a href="main.do" onclick="alreadyLogin()">회원가입</a>
					</c:when>
				</c:choose></li>
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

	<div class="container">
		<h2 class="text-primary">회원 정보 상태</h2>
		<div class="container">
			<table class="table table-striped">
				<tr>
					<td>아이디 :</td>
					<td>${member.id }</td>
				</tr>
				<tr>
					<td>이름 :</td>
					<td>${member.name }</td>
				</tr>
				<tr>
					<td>성별 :</td>
					<td>${member.sex }</td>
				</tr>
				<tr>
					<td>주소 :</td>
					<td>${member.address }</td>
				</tr>
				<tr>
					<td>이메일 :</td>
					<td>${member.email }</td>
				</tr>
				<tr>
					<td>전화번호 :</td>
					<td>${member.phoneNumber }</td>
				</tr>
				<tr>
					<td>가입날짜 :</td>
					<td>${member.joindate }</td>
				</tr>
				<tr>
					<td><a class="btn btn-default" href="myinfoUpdateForm.do">회원
							정보 수정</a><input type="button" value="회원 탈퇴" class="btn btn-default"
						onclick="delChk()"></td></tr>
			</table>
		</div>
	</div>



</body>
</html>