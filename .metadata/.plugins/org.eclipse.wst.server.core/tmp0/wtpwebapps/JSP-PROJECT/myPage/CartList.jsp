<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	display: flex;
	flex-direction: column;
	justify-content: center;
	font-family: 'Arial', sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 40px;
}
.cartResult img {
	width: 100%; /* 이미지 너비를 ul에 맞춤 */
	height: 50%; /* 이미지 비율 유지 */
	max-width: 150px; /* 최대 너비 설정 */
}
.CartList {
	text-align: center;
	margin: 0; /* 기존 마진 제거 */
	margin-bottom:10px;
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
.td-count-con {
    text-align: -webkit-center;
}
.main {
	align-self: center;
}
.main h2 {
	text-align: center;
}
.count-con{
    display: flex;
    flex-direction: row;
}

/* 검색 결과 및 페이지네이션 컨테이너 스타일 */
.row, #pagination {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
}
/* 페이지네이션 버튼 스타일 */
.count-btn, .creditbtn{
	padding: 5px 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin: 10px 5px;
	background-color: #fff;
	cursor: pointer;
}

/* 페이지네이션 버튼 스타일 */
.page-btn1 {
	padding: 5px 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin: 10px 5px;
	background-color: #fff;
	cursor: pointer;
}

.count-btn:hover, .page-btn.active, .creditbtn{
	background-color: #007bff;
	color: #fff;
}

.count-text {
	text-align: center;
	width: 20px;
	padding: 5px 10px;
	margin: 10px 5px;
}
tr {
	padding: 5px;
}
#credit {
	flex-direction: row;
}
.creditbtn:hover {
	background-color: #0056b3;
	border-radius: 5px;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../myPage/CartList.js"></script>
<link rel="stylesheet" type="text/css" href="../css/header.css">
<link rel="icon" href="/img/favicon.png" type="image/x-icon">
</head>
<body>
<header>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<div class="main">
		<h2>장바구니</h2>
		<input type="hidden" id="flag" value="${flag }">
		<form class="cartForm" action="${pageContext.request.contextPath}/myPage/InsertOrder.bo">
			<div class="CartList">
				<table>
					<tr>
						<th width="10%">선택</th>
						<th width="15%">이미지</th>
						<th width="50%">제목</th>
						<th width="15%">가격</th>
						<th width="15%">수량</th>
					</tr>
					<!-- 장바구니에 담은 주문 내역이 출력될 구역 -->
					
					<c:choose>
						<c:when test="${cartList != null and fn:length(cartList) > 0 }">
							<!-- 장바구니에 내용이 있을 경우 출력 -->
							<c:forEach var="cart" items="${cartList }">
								<tr class="cartResult">
									<td style="text-align: center;">
										<input type="hidden" name="isbn" value="${cart.isbn }">
										<input class="itemCheckbox" type="checkbox">
									</td>
									<td>
										<img alt="${cart.title }" src="${cart.image }">
										<input type="hidden" class="cartNum" name="cartNum" value="${cart.cartNum }">
									</td>
									<td><input type="hidden" name="title" value="${cart.title }">${cart.title }</td>
									<td><input type="hidden" name="disc" value="${cart.discount }">${cart.discount }</td>
									<td class="td-count-con">
										<button type="button" class="count-btn" value="128465">&#128465;</button>
										<div class="count-con">
											<button class="count-btn" type="button" value="8592">&#8592;</button>
											<input class="count-text" type="text" readonly value='1'>
											<button class="count-btn" type="button" value="8594">&#8594;</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<div class="CartList" id="credit" style="justify-content: flex-end;">
				<div>
					<table>
						<tr>
							<th style="padding-right: 10px;">총 금액</th>
							<td id="totalPrice">0</td>
						</tr>
					</table>
				</div> 
				<button class="creditbtn" type="button" style=" width: 25%;">결제</button>
			</div>
		</form>
	</div>

</body>
</html>