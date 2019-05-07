<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>makeCookie</title>
</head>
<body>

<%@page import="java.net.URLEncoder"%>
<%
Cookie cookie = new Cookie("id", "kim");
Cookie cookie2 = new Cookie("pwd", "1234");
Cookie cookie3 = new Cookie("age", "20");
Cookie cookie4 = new Cookie("hp", "010-1111-2222");

cookie.setMaxAge(10);	//쿠키 유효시간(초) : 10초 후 삭제
cookie2.setMaxAge(10);
cookie3.setMaxAge(10);
cookie4.setMaxAge(10);


response.addCookie(cookie);	//쿠키 생성
response.addCookie(cookie2);
response.addCookie(cookie3);
response.addCookie(cookie4);

%>
쿠키가 생성되었다.<br>

<a href="useCookie.jsp">쿠키 확인?</a>

</body>
</html>