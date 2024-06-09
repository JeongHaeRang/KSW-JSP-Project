<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 자주 묻는 질문</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f8f8f8;
    padding: 20px;
}

h3 {
    color: #333;
}

.btnall  button {
    background-color: rgb(36, 39, 39);
    color: white;
    padding: 10px 20px; /* padding 값을 조정 */
    cursor: pointer;
    display: inline-block;
    width: 150px;
    height: 50px;
    border-radius: 4px;
    text-align: center;
    margin-right: -6px;
    font-size: 14px;  /* font-size 값을 조정 */
    font-weight: bold;
    line-height: 30px;  /* line-height 값을 추가 */
    border: none;
}

.btnall button:hover{
    color:white;
    background-color: gray;
}

</style>
</head>
<body>
<h3>FAQ 자주 묻는 질문</h3>
<hr/>
    <div class="btnall" >
        <button id="btn1" onclick="location.href='faq1.jsp'">회원관리</button>
        <button id="btn2" onclick="location.href='faq2.jsp'">주문 및 결제</button>
        <button id="btn3" onclick="location.href='faq3.jsp'">배송정보</button>
        <button id="btn4" onclick="location.href='faq4.jsp'">반품/교환/환불</button>
        <button id="btn5" onclick="location.href='faq5.jsp'">기타</button>
    </div>
</body>
</html>