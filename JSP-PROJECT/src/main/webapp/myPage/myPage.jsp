<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${userid }'smyPage</title>
<link rel="icon" href="/img/favicon.png" type="image/x-icon"> 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="mypage.js"></script>
<link rel="stylesheet" type="text/css" href="../css/header.css">
</head>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 40px;
}
.list {
	max-width : 350px;
	padding: 10px;
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
.order-list {
	width: 100%;
	justify-content:space-evenly;
	display: flex;
	margin: 10px;
}
.config-list {
	width: 100%;	
	justify-content:space-evenly;
	display: flex;
	margin: 10px;
}
.btn {
	width: 150px;
	padding: 10px 20px;
	font-size: 16px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
.btn:hover {
	opacity: 0.9;
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
	<input type="hidden" id="flag" value="${flag}">
	<div style="text-align: -webkit-center;">
		<div class="list">
			<h1>${userid }님의마이페이지</h1>
			<div class="order-list">
				<div>
					<button class="btn" type="button" onclick="location.href='${pageContext.request.contextPath }/myPage/OrderList.bo'">
					[구매 내역]</button>
				</div>
				<div>
					<button id="cart" class="btn" type="button" onclick="location.href='${pageContext.request.contextPath }/search/CartList.bo'">
					[장바구니]</button>
				</div>
			</div>
			<div class='config-list'>
				<div>
					<button class="btn" type="button" onclick="location.href='${pageContext.request.contextPath }/myPage/UserInfoCheck.bo'">
					[회원정보 수정]</button>
				</div>
				<div>
					<button class="btn" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/inquiry.bo'">
					[1:1문의]</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>