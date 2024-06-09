<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		${userid }님 안녕하세요. 
		<a href="${pageContext.request.contextPath}/login/LogOut.bo">로그아웃</a><br>
		<a href="${pageContext.request.contextPath}/myPage/myPage.bo">마이페이지</a>
	</div>
</body>
</html>