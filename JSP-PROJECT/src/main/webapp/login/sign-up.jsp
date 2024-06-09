<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KSW 회원가입</title>
<!-- 다음 주소 찾기 API -->
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="/img/favicon.png" type="image/x-icon"> 
<script src="sign-up.js"></script>
</head>
<style>
/* 스타일은 여기에 작성합니다 */
/* 예시: 폼 스타일 */
form {
	margin: 20px auto;
	width: 300px;
	border: 1px solid #ccc;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#userid {
	margin-right: 10px;
}

input[type="text"], input[type="password"], input[type="date"] {
	width: 100%;
	margin-bottom: 10px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	box-sizing: border-box;
}

input[type="submit"] {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

.error {
	color: red;
}

.content {
	justify-content: space-between;
	display: flex;
	flex-direction: column;
}

.input-id {
	display: flex;
	flex-direction: row;
}

.btn {
	margin-bottom: 10px;
	background-color: #007bff;
	padding: 10px;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}
.btn:hover {
	background-color: #0056b3;
}

#dbchkId {
	margin-bottom: 10px;
	width: 33%;
}

a {
	text-decoration: none;
	color: inherit;
}


.password-check {
	margin-bottom: 10px;
}
.email {
	display: flex;
	flex-direction: row;
}
a {
	text-decoration: none;
	color: inherit;
}

.header-flex {
   display: flex;
   flex-direction : row;
   align-items: center;
    justify-content: center;
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
.logo {
    height: 170px;
    width: 300px;
}
</style>
<body>

	<header>
		<div class="header-flex">
		   <div class="header-left">
		      <h2>
		         <a href="${pageContext.request.contextPath}/main/main-page.bo"><img class="logo" alt="메인페이지로 이동" src="../img/ksw.png"></a>
		      </h2>
		   </div>
		</div>
	</header>
	
	
	<%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
    <div style="color: red; text-align: center; margin-bottom: 10px;">
        <%= errorMessage %>
    </div>
    <%
        }
    %>
	
	
	
	<form id="signForm" name="joinForm"
    action="${pageContext.request.contextPath}/login/Sign-Up.bo"
    method="post">
		<div class="content">
			<div>
				<h3 style="text-align: center;">KSW 회원가입</h3>
			</div>
			<!-- 사용자 아이디 작성 -->
			<div class="input-id">
				<input type="text" id="userid" name="userid" maxlength= "16" placeholder="사용자 아이디(5자 이상,16자 미만)">
				<button style="width: 33%;" class="btn" type="button"  name="idcheck"
					onclick="CheckId(joinForm.userid.value)">중복확인</button>
			</div>
			<span id = "idcheck"></span>
			<input type="hidden" name="dbchkId" value="dbchkId" />

			<!-- 사용자 이메일 작성 -->
			<div class="email">
				<input type="text" id="useremail1" name="useremail1"
				placeholder="사용자 이메일" required>
				<span>@</span>
				<select id="useremail2" name="useremail2" style="margin-bottom: 10px; padding: 10px;">
					<option value="gmail.com" >gmail.com</option>
					<option value="naver.com">naver.com</option>
				</select>
			</div>


			<!-- 사용자 비밀번호 작성 -->
			<input type="password" id="password" name="password"
				placeholder="비밀번호" required> <input type="password"
				id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인"
				onkeyup="checkPassword()" required> <span
				id="passwordMessage" class="error"></span>

			<!-- 사용자 이름 작성 -->
			<input type="text" id="username" name="username" placeholder="사용자 이름"
				required>

			<!-- 사용자 생일 작성 -->
			<input type="date" id="userbirth" name="userbirth"
				placeholder="사용자 생일" required>

			<!-- 사용자 전화번호 작성 -->
			<input type="text" id="userphone" name="userphone" placeholder="전화번호"
				maxlength="11">

			<!-- 사용자 주소 작성 -->
			<button type="button" class="btn btn-outline-secondary findbtn"
				onclick="sample4_execDaumPostcode()">주소 찾기</button>
			<input style="background-color: #f5f5f5;" type="text" name="add1" id="sample4_roadAddress" placeholder="도로명주소" readonly>
			<input style="background-color: #f5f5f5;" type="text" name="add2" id="sample4_postcode" placeholder="우편번호" readonly>
			<span id="guide" style="color: #999; display: none"></span>
			<input type="text" name="add3" id="sample4_detailAddress" placeholder="상세주소">
			<button class='btn' type="button" id="signup" name="signup">회원가입</button>
		</div>
	</form>
</body>
</html>