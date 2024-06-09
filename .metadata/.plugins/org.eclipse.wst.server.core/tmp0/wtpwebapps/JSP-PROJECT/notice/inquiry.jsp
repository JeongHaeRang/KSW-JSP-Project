<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>1:1 문의</title>
    <style>
.inquiry-link {
            display: block;
            text-align: right;
            margin-bottom: 20px;
            font-weight: bold;
            color: #4285f4;
        }

table {
	width: 100%; /* 브라우저의 가로 너비에 맞게 테이블의 너비 조절 */
    max-width: 900px; /* 최대 너비를 지정하여 테이블이 너무 커지지 않도록 제한 */
    border-collapse: collapse;
    border-spacing: 0;
	margin: 0 auto;
}
</style>
</head>
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
    <h2>${username }(${userid })님의 1:1 문의 목록</h2>
    <p align="right">총 문의 개수 ${totalCnt}</p> 
    <table border="1" style="border-collapse: collapse; border-spacing: 0; width: 900px;">
        <thead>
        <!-- 테이블 예시 -->
            <tr align="center" valign="middle">
                <th width="10%">번호</th>
                <th width="15%">작성자</th>
                <th width="30%">제목</th>
                <th width="30%">내용</th>
                <th width="15%">작성일</th>
            </tr>
        </thead>
        <tbody>
			<c:choose>
				<c:when test="${inquiryList != null and fn:length(inquiryList) > 0 }">
					<c:forEach var="inquiry" items="${inquiryList }">
						<tr align="center" valign="middle"
							onmouseover="this.style.background='#bbdefb'"
							onmouseout="this.style.background=''" height="23px">
							<td height="23px;">${inquiry.qnaNum }</td> <!-- 문의 번호 pk값 -->
							<td height="23px;">${inquiry.userId}</td> <!-- 유저아이디 fk값 -->
							<td height="23px;">${inquiry.qnatitle }</td> <!-- 문의 제목 -->
							<td height="23px;">${inquiry.qnaDetails }</td> <!-- 문의 내용 -->
							<td height="23px;">${inquiry.createdat }</td> <!-- 작성날짜 -->
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr style="height: 50px;">
						<td colspan="7" style="text-align: center">문의 내역이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
    </table>
    <!-- 페이징 처리 -->
	<table class="pagination-table">
		<tr align="center" valign="middle">
			<td>
				<c:if test="${nowPage > 1 }">
					<a href="${pageContext.request.contextPath }/notice/inquiry.bo?page=${nowPage -1}">[&lt;]</a>
				</c:if> 
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:choose>
						<c:when test="${i == nowPage }">[${i }]</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath }/notice/inquiry.bo?page=${i}">[${i}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach> 
				<c:if test="${nowPage < totalPage }">
					<a href="${pageContext.request.contextPath }/notice/inquiry.bo?page=${nowPage + 1}">[&gt;]</a>
				</c:if>
			</td>
		</tr>
	</table>
	<a class="inquiry-link" href="/notice/inquiryWrite.bo">[1:1 문의하기]</a>
</body>
</html>
