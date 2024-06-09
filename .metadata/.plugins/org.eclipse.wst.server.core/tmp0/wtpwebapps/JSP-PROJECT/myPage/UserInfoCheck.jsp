<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 확인</title>
</head>
<body>
	<c:if test="${not empty param.flag}">
		<c:if test="${not param.flag}">
			<script>
				alert("비밀번호가 틀렸습니다.");
			</script>
		</c:if>
	</c:if>
	<h2>비밀번호 확인</h2>
    <p style="font-size: 14px; line-height: 22px; letter-spacing: -0.01em; color: #595959;">${userid }님의 안전한 개인정보보호를 위해 비밀번호를 입력해 주세요.</p>
    <hr>
    <form action="${pageContext.request.contextPath}/myPage/UserInfoChange.bo" method="post">
        <label for="userpw" style="padding: 12px 10px; font-size: 14px; font-weight: 600;">비밀번호</label>
        <input type="password" id="userpw" name="userpw" required placeholder="비밀번호를 입력해 주세요.">
        <input type="submit" value="확인">
    </form>
</body>
</body>
</html>