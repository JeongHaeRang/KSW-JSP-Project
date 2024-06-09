<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 스타일은 여기에 작성합니다 */
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	display: flex;
	align-items: center;
	flex-direction: column; height : 100vh;
	margin: 0;
	height: 100vh;
}

.form-horizontal {
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	width: 300px;
}

.form-horizontal h1 {
	color: #333;
	margin-bottom: 20px;
	text-align: center;
}
header {
	width: -webkit-fill-available;
}

input[type="text"], input[type="email"] {
	width: calc(100% - 20px);
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

.findbtn {
	width: calc(100% - 20px);
	padding: 10px;
	margin-bottom: 10px;
	border: none;
	border-radius: 4px;
	color: #fff;
	cursor: pointer;
	background-color: #4CAF50;
}

button:hover {
	opacity: 0.9;
}

a {
	text-decoration: none;
	color: inherit;
}

.header-flex {
	display: flex;
	flex-direction: row;
	align-items: center;
	padding: 10px 30%;
}

.header-left {
	color: #007bff;
}

.header-right {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	justify-content: space-between;
	border: 1px #007bff solid;
	padding: 10px
}

.header-menu {
	display: flex;
	flex-direction: row;
	align-content: flex-start;
	justify-content: space-between;
	margin-top: 10px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="/img/favicon.png" type="image/x-icon"> 
<link rel="stylesheet" type="text/css" href="../css/header.css">
</head>
<body> 
<header>
<input type="hidden" value="${userid }">
<div class="header-flex">
	<div class="header-left">
			<a href="${pageContext.request.contextPath}/main/main-page.bo"><img class="logo" alt="메인페이지로 이동" src="../img/ksw.png"></a>
	</div>
	<form id="searchFrm" action="/search/SearchView.bo" method="post">
		<div>
			<input type="text" name="search" id="keyword"
				placeholder="검색하실 책 제목을 입력하세요">
		</div>
		<div>
			<button type="submit" id="searchBtn">검색</button>
		</div>
	</form>
	<c:choose>
		<c:when test="${not empty userid}">
			<div class="header-right">
				<div>${userid }님 안녕하세요.</div>
				<div class="header-menu" >
					<div style="margin-right: 20px;"><a href="${pageContext.request.contextPath}/login/LogOut.bo">로그아웃</a></div>
					<div><a href="${pageContext.request.contextPath}/myPage/myPage.bo">마이페이지</a></div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			  <div style="display: flex;">
			    <div class="header-right"><a href="${pageContext.request.contextPath}/login/Sign-up-in.bo">로그인</a></div>
			  </div>
		</c:otherwise>
	</c:choose>
</div>
<nav>
<ul class="nav-bar">
	<li><a href="${pageContext.request.contextPath}/main/main-page.bo">메인 페이지</a></li>
	<li><a href="${pageContext.request.contextPath}/notice/notice-main.bo">고객센터</a></li>
</ul>
</nav>
</header>
<form class="form-horizontal" role="form" method="POST"
		action="${pageContext.request.contextPath}/login/FindPw.bo">
		<h3 style="text-align: center;">비밀번호 찾기</h3>
		<div class="row">
			<div class="col-md-10 inputbb">
				<div class="form-group has-danger">
					<div class="input-group mb-2 mr-sm-2 mb-sm-0">
						<input type="text" name="name" class="form-control" id="name"
							placeholder="이름" required autofocus>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 inputbb">
				<div class="form-group">
					<div class="input-group mb-2 mr-sm-2 mb-sm-0">
						<input type="text" name="id" class="form-control" id="id"
							placeholder="아이디" required>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 inputbb">
				<div class="form-group">
					<div class="input-group mb-2 mr-sm-2 mb-sm-0">
						<input type="email" name="email" class="form-control" id="email"
							placeholder="이메일" required>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 inputbb">
				<button type="submit" id="findpw" class="btn btn-outline-secondary findbtn">찾기</button>
			</div>
		</div>
	</form>
</body>
</html>