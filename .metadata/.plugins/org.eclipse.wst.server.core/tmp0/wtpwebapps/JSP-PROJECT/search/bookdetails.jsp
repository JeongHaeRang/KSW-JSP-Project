<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bookdetails.title}</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<style>
.nanum-gothic-regular {
	font-family: "Nanum Gothic", sans-serif;
	font-weight: 400;
	font-style: normal;
}

/* 기본 스타일 */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background: #f4f4f4;
}

.container {
	width: 80%;
	margin: 20px auto;
	background: white;
	padding: 20px;
}
/* 이미지, 제목, 상세정보 컨테이너 스타일 */
.book-detail {
	display: flex;
	margin-bottom: 20px;
}

.book-cover img {
	max-width: 100%;
	height: auto;
}

.topColLeft, .topColRight {
	flex: 1;
}

.topColLeft {
	margin-right: 20px;
}

.topColRight {
	display: flex;
	flex-direction: column;
}

.bk_infoTop {
	height: 20%;
}

.book-info {
	flex-grow: 1;
	height: 100%;
}

.book-info, .button {
	padding: 10px 0;
}

.book-info th {
	width: 30%;
}

.book-info td {
	width: 70%;
}

.book-info table {
	width: 100%;
	height: inherit;
}

.button {
	text-align: right;
	/* position: sticky; */
	top: 100%;
	height: 8%
}
/* 버튼 스타일 */
button {
	padding: 10px 20px;
	margin-right: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.button-primary {
	background-color: #4285f4;
	color: white;
}
/* 탭 및 내용 스타일 */
.tab-content ul {
	list-style: none;
	padding: 0;
	display: inline-flex;
	justify-content: space-between;
	border-bottom: 2px solid #ddd;
	margin-bottom: 20px;
}

.tab-content ul li {
	padding: 10px;
}

.tab-content ul li a {
	text-decoration: none;
	color: #4285f4;
	font-weight: bold;
}

.botCol1, .botCol2 {
	padding: 10px 0;
}

.boder {
	border: 1px solid black;
}
/* 반응형 디자인 */
@media ( max-width : 768px) {
	.book-detail {
		flex-direction: column;
	}
}
/* 리뷰 테이블 스타일 */
.botCol2 table {
    width: 100%; /* 테이블 너비를 부모 컨테이너에 맞춤 */
    border-collapse: collapse; /* 셀 사이의 경계를 합침 */
    margin-bottom: 20px; /* 테이블 사이의 마진 추가 */
}

.botCol2 th, .botCol2 td {
    border: 1px solid #ddd; /* 경계선 스타일 */
    padding: 8px; /* 셀 내부 패딩 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
}

.botCol2 th {
    background-color: #f2f2f2; /* 헤더 배경색 */
    color: #333; /* 헤더 텍스트 색상 */
}

.botCol2 td {
    background-color: #fff; /* 셀 배경색 */
    color: #666; /* 셀 텍스트 색상 */
}

.botCol2 td > table {
    margin: 10px 0; /* 내부 테이블 상하 마진 */
    width: auto; /* 내부 테이블 너비를 내용에 맞춤 */
}

.botCol2 td > table th,
.botCol2 td > table td {
    padding: 4px; /* 내부 테이블 셀 패딩 */
    border: 1px solid #eee; /* 내부 테이블 경계선 스타일 */
    background-color: #fafafa; /* 내부 테이블 배경색 */
}

/* 리뷰 텍스트 스타일 */
.botCol2 td .review-text {
    display: block; /* 블록 레벨 요소로 만들기 */
    padding: 10px;
    margin-top: 10px; /* 리뷰와 테이블 사이 마진 */
    background-color: #e9e9e9; /* 리뷰 배경색 */
    border: 1px solid #dcdcdc; /* 리뷰 경계선 스타일 */
    border-radius: 4px; /* 경계선 둥글게 */
}
a {
	text-decoration: none;
	color: inherit;
}
.header-flex {
	display: flex;
	flex-direction : row;
	align-items: center;
	justify-content: space-between;
	padding : 10px 40px;
}
.header-left {
	color: #007bff;
}
.header-right {
	display:flex;
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
<link rel="stylesheet" type="text/css" href="../css/header.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="bookdetail.js"></script>
<link rel="icon" href="/img/favicon.png" type="image/x-icon"> 
<link rel="stylesheet" type="text/css" href="../css/header.css">
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

<body>
<input type="hidden" id="discord" value="${bookdetails.discount}">
<input type="hidden" id="isbn" value="${bookdetails.isbn}">
	<div class="container">
		<div class="book-detail">
			<div class="topColLeft book-cover">
				<img name="bookCover" id="bookCover" src="${bookdetails.image}"
					alt="${bookdetails.title} cover">
			</div>
			<div class="topColRight">
				<div class="bk_infoTop">
					<h2 class="booktitle" id="bookTitle">${bookdetails.title}</h2>
				</div>
				<div class="book-info">
					<table>
						<tr>
							<th align="left">가격</th>
							<td id="bk_dis" align="center"></td>
						</tr>
						<tr>
							<th align="left">저자</th>
							<td align="center">${bookdetails.author}</td>
						</tr>
						<tr>
							<th align="left">출판사</th>
							<td align="center">${bookdetails.publisher}</td>
						</tr>
						<tr>
							<th align="left">출간일</th>
							<td align="center"><fmt:formatDate
									value="${bookdetails.pubdate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</table>
				</div>
				<div class="button">
					<button type="button" id="cart" class="button-primary">장바구니 담기</button>
					<button type="button" id="buy" class="button-primary">구매하기</button>
				</div>
			</div>

		</div>
		<div class="tab-content">
			<ul>
				<li><a href="#botCol1">도서 정보</a></li>
				<li><a href="#botCol2">리뷰</a></li>
			</ul>
		</div>
		<!-- 상품정보 -->
		<div class="boder">
			<div class="botCol1" id="botCol1">
				<h3>${bookdetails.title}의소개</h3>
				<div id="infoWrap_txtInner" class="infoWrap_txtInner">
					<textarea class="txtContentText" id="txtContentText">${bookdetails.description}</textarea>
					<!-- JavaScript를 통해 내용을 동적으로 추가할 예정 -->
				</div>
			</div>
			<!-- 리뷰 -->
			<hr>
			<div class="botCol2" id="botCol2">
				<table>
					<c:choose>
					    <c:when test="${empty getreplys}">
					        <tr>
					            <td colspan="4" style="text-align: center;">리뷰가 없습니다.</td>
					        </tr>
					    </c:when>
					    <c:otherwise>
					        <c:forEach var="replys" items="${getreplys}">
					            <tr>
					                <th>${replys.userid}</th>
					                <td>
					                    <table>
					                        <tr>
					                            <th>날짜</th>
					                            <th>${replys.replyinsertdate}</th>
					                            <td>평점</td>
					                            <td>
					                                <c:if test="${replys.replygrade == 1}">&#10029;&#10025;&#10025;&#10025;&#10025;</c:if>
					                                <c:if test="${replys.replygrade == 2}">&#10029;&#10029;&#10025;&#10025;&#10025;</c:if>
					                                <c:if test="${replys.replygrade == 3}">&#10029;&#10029;&#10029;&#10025;&#10025;</c:if>
					                                <c:if test="${replys.replygrade == 4}">&#10029;&#10029;&#10029;&#10029;&#10025;</c:if>
					                                <c:if test="${replys.replygrade == 5}">&#10029;&#10029;&#10029;&#10029;&#10029;</c:if>
					                            </td>
					                        </tr>
					                    </table>
					                    ${replys.reply}
					                </td>
					            </tr>
					        </c:forEach>
					    </c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
