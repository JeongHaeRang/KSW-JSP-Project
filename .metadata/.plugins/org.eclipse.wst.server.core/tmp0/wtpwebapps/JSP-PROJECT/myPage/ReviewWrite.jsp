<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${tiele }리뷰 작성</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333333;
        }

        a:visited {
            color: #555555;
            text-decoration: none;
        }

        a:hover {
            color: #000000;
            text-decoration: none;
            font-weight: bold;
        }

        a:link {
            color: #555555;
            text-decoration: none;
        }

        table {
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        td {
            padding: 10px;
        }

        input[type="text"], textarea, select {
            width: 100%;
            padding: 8px;
            border: 1px solid #dddddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        button {
            background-color: #555555;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        button:hover {
            background-color: #000000;
        }
    </style>
</head>
<link rel="icon" href="/img/favicon.png" type="image/x-icon"> 
<link rel="stylesheet" type="text/css" href="../css/header.css">
<link rel="stylesheet" type="text/css" href="../css/header.css">

<script src="../myPage/ReviewWrite.js"></script>
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
    <div id="review">
        <input type="hidden" id="isbn" name="isbn" value="${isbn }">
            <table>
            	<tr>
                    <td>주문번호:</td>
                    <td><input type="text" readonly value="${ordernum }" id="ordernum" name="ordernum"></td>
                </tr>
            	<tr>
                    <td>책제목:</td>
                    <td><input type="text" readonly value="${title }" id="reviewTitle" name="reviewTitle"></td>
                </tr>
                <tr>
                    <td>별점:</td>
                    <td>
                        <select id="rating" name="rating">
                            <option value="1">&#10029;&#10025;&#10025;&#10025;&#10025;</option>
                            <option value="2">&#10029;&#10029;&#10025;&#10025;&#10025;</option>
                            <option value="3">&#10029;&#10029;&#10029;&#10025;&#10025;</option>
                            <option value="4">&#10029;&#10029;&#10029;&#10029;&#10025;</option>
                            <option value="5">&#10029;&#10029;&#10029;&#10029;&#10029;</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>내용:</td>
                    <td><textarea id="reviewContent" name="reviewContent" rows="4" cols="50"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="button" class="insertBtn">작성 완료</button>
                        <button type="button" onclick="location.href='${pageContext.request.contextPath }/myPage/OrderList.bo'">취소</button>
                    </td>
                </tr>
            </table>
    </div>
</body>
</html>
