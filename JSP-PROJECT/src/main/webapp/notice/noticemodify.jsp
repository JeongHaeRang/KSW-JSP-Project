<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 수정</title>
    <style>
        /* 스타일링을 위한 CSS */
        body {
            font-family: Arial, sans-serif;
        }
        form {
            margin: 0 auto;
            width: 50%;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 5px;
            margin-top: 5px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            margin-top: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>공지사항 수정</h1>
    <form id="inquiryWrite" action="${pageContext.request.contextPath}/notice/noticemodifyOk.bo?notificationNum=${notificationNum}" method="post">
        <label for="userid">작성자:${userid }</label>
        <label for="notificationTitle">제목:</label>
        <input type="text" id="notificationTitle" name="notificationTitle" value="${getnotificationTitle }" required>
        
        <label for="notificationDetails">내용:</label>
        <textarea id="notificationDetails" name="notificationDetails" rows="5" required>${getnotificationTitle }</textarea>
        
        <input type="submit" value="수정하기">
    </form>
</body>
</html>