<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KSW 회원가입 성공</title>
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
#login-page, #main-page {
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
.page-function {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	width: 100%;
}
.result {
	padding-bottom: 20px;
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
	<form>
		<strong class="result">회원가입을 완료하였습니다.</strong>
		<div class="page-function">
			<button type="button" id="main-page" onclick="location.href='${pageContext.request.contextPath}/main/main-page.bo'">메인페이지</button>
			<button type="button" id="login-page" onclick="location.href='${pageContext.request.contextPath}/login/Sign-up-in.bo'">로그인</button>
		</div>
	</form>
</body>
</html>