<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="icon" href="/img/favicon.png" type="image/x-icon"> 
<link rel="stylesheet" type="text/css" href="../css/header.css">
</head>
<style>
.ulIndex {
	list-style: none;
	padding: 20px;
}
.index {
	background-color: white;
	width: 40%;
}
.movebtn {
	padding: 10px;
	margin-bottom: 20px;
}
.movebtn:last-child {
	margin-bottom: 0;
}
</style>
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
<div style="text-align: -webkit-center;">
	<div class="index">
		<ul class="ulIndex">	
			<li class="movebtn btn" onclick="location.href='${pageContext.request.contextPath}/notice/getNotificationList.bo'">공지사항</li>	<!-- 데이터베이스에서 목록 불러오기까지만 가능합니다 -->
			<li class="movebtn btn" onclick="location.href='${pageContext.request.contextPath}/notice/faq.jsp'">자주 묻는 질문</li>					<!-- FAQ 내용은 임의로 작성했습니다 -->
			<li class="movebtn btn" onclick='location.href="${pageContext.request.contextPath}/notice/inquiry.bo"'>1:1문의</li>				<!-- 데이터베이스와 작업을 안 거쳐서 우선 jsp로 바로 갈 수 있게 했습니다 -->
		</ul>
	</div>
</div>
</body>
</html>