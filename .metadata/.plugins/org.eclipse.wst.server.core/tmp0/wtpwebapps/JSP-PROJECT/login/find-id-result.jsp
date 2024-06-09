<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KSW 아이디 찾기 결과 페이지</title>
</head>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	display: flex;
	height: 100vh;
	margin: 0;
	flex-direction: column;
	margin-top: 50px;
}
button {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: none;
    border-radius: 4px;
    color: #000;
    cursor: pointer;
}
form {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    width: 300px;
    display: flex;
    flex-direction: column;
    align-items: center;
	align-self: center;
}
#login-page {
    background-color: #4CAF50;
    width: 49%;
}
#findid, #findpw {
    background-color: #e7e7e7;
    color: #333;
    width: 49%;
}
.button-row{
	display: flex;
	flex-direction: row;
	justify-content: space-between;
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
   padding : 10px 30%;
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
<body>
	<header>
		<div class="header-flex">
		   <div class="header-left">
		      <h2>
		         <a href="${pageContext.request.contextPath}/main/main-page.bo">K.S.W.</a>
		      </h2>
		   </div>
		</div>
	</header>
	<form action="">
		<div class="id_find_result">
			<c:choose>
				<c:when test="${not empty userid }">
					<div>
						<p>회원님의 아이디는 <strong>'${userid }'</strong> 입니다.</p>
					</div>
				</c:when>
				<c:otherwise>
					<div>
						<p>검색 결과가 없습니다.</p>
						<p>이름 혹은 이메일을 다시 확인해 주세요.</p>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="button-row">
				<c:choose>
					<c:when test="${not empty userid }">
						<button id="findid" type="button" onclick="location.href='${pageContext.request.contextPath}/login/Find-pw.bo'">비밀번호 찾기</button>
					</c:when>
					<c:otherwise>
					`	<button id="findpw" type="button" onclick="location.href='${pageContext.request.contextPath}/login/Find-id.bo'">아이디 찾기</button>
					</c:otherwise>
				</c:choose>
				<button id="login-page" type="button" onclick="location.href='${pageContext.request.contextPath}/login/Sign-up-in.bo'">로그인</button>
			</div>
		</div>
	</form>
</body>
</html>