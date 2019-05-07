<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editCookie</title>
</head>
<body>

<%
//쿠키 수정(value만 수정), 삭제 함수는 없음
response.addCookie(new Cookie("id", "lee"));
response.addCookie(new Cookie("pwd", "5678"));
response.addCookie(new Cookie("age", "30"));
response.addCookie(new Cookie("hp", "010-3333-4444"));

%>
변경될 아이디 : ${cookie.id.value}<br>
쿠키가 변경됐음!
<a href="useCookie.jsp">쿠키 확인</a>


</body>
</html>