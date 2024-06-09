<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            padding: 20px;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: rgb(36, 39, 39);
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<link rel="icon" href="/img/favicon.png" type="image/x-icon"> 
<link rel="stylesheet" type="text/css" href="../css/header.css">
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
<body>
<div>
	<c:if test="${not empty param.flag}">
		<c:if test="${not param.flag}">
			<script>
				alert("관리자가 아닙니다.");
			</script>
		</c:if>
	</c:if>
    <h1>공지사항</h1>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>작성자</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성일</th>
                <th>수정일</th>
                <c:if test="${isAdmin}">
                    <th>수정</th>
                    <th>삭제</th>
                </c:if>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="notification" items="${NotificationList}" varStatus="loop">
                <tr>
                    <td>${loop.index + 1}</td>
                    <td>${notification.userId}</td>
                    <td>${notification.notificationTitle}</td>
                    <td>${notification.notificationDetails}</td>
                     <td>
                        <fmt:parseDate var="createdDate" value="${notification.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" />
                        <fmt:formatDate value="${createdDate}" pattern="yyyy년 MM월 dd일" />
                    </td>
                    <td>
                        <fmt:parseDate var="updatedDate" value="${notification.updatedAt}" pattern="yyyy-MM-dd HH:mm:ss" />
                        <fmt:formatDate value="${updatedDate}" pattern="yyyy년 MM월 dd일" />
                    </td>
                    <c:if test="${isAdmin}">
                        <td><a href="${pageContext.request.contextPath}/notice/noticemodify.bo?notificationNum=${notification.notificationNum}">수정</a></td>
                        <td><a href="${pageContext.request.contextPath}/notice/noticdelete.bo?notificationNum=${notification.notificationNum}">삭제</a></td>
                    </c:if>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a style="float: right;" href="${pageContext.request.contextPath}/notice/noticeWrite.bo">[공지사항 작성]</a>
</div>
</body>
</html>
