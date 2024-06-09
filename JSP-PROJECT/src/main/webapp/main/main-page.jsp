<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KSW 임시페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 40px;
}
#trafficIsNotNull {
	text-align: center;
}
#traffic {
	display: flex;
	flex-direction: row;
	padding: 20px;
	justify-content: space-between;
}
ul {
	padding: 0px;
	margin-right: 20px;
}
#traffic ul {
	max-width : 220px;
	padding: 10px; /* 패딩 유지 */
	background-color: #ffffff;
	border: 1px solid #dddddd;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	transition: box-shadow 0.3s ease;
	display: flex; /* 이미지와 텍스트를 세로로 정렬 */
	flex-direction: column; /* 컨텐츠를 세로로 정렬 */
	align-items: center; /* 가운데 정렬 */
}
#traffic ul:first-child {
	margin-left: 30px;
}
#traffic ul:last-child{
	margin-right: 30px;
}
#traffic ul:hover {
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}
#traffic img {
	width: 100%; /* 이미지 너비를 ul에 맞춤 */
	height: 100%; /* 이미지 비율 유지 */
	max-width: 200px; /* 최대 너비 설정 */
	margin-bottom: 10px; /* 이미지와 텍스트 사이의 마진 */
}
#traffic li {
	list-style: none;
	padding: 8px 12px;
	border-bottom: 1px solid #f0f0f0;
}
#traffic li:last-child {
	border-bottom: none;
}


.header-right {
  display: inline-block; /* 인라인 블록 요소로 변경 */
  margin-right: 10px;
}

.header-right:last-child {
  margin-right: 0;
}

.header-right {
  display: inline-block;
  margin-right: 10px;
  white-space: nowrap; /* 텍스트를 한 줄로 유지 */
}
</style>
<script src="main-page-traffic.js"></script>
<link rel="icon" href="/img/favicon.png" type="image/x-icon"> 
<link rel="stylesheet" type="text/css" href="../css/header.css">
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
<div id="trafficIsNotNull">
</div>
<div class="order-traffic">
<!-- 사람들의 주문량에 따른 추천 목록 -->
</div>
</body>
</html>