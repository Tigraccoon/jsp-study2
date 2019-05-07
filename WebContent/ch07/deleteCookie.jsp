<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteCookie</title>
</head>
<body>

<%
Cookie cookie = new Cookie("id", "");	//쿠키값에 id에 대해 빈값을 처리 id를 삭제
Cookie cookie2 = new Cookie("pwd", "");
Cookie cookie3 = new Cookie("age", "");
Cookie cookie4 = new Cookie("hp", "");

cookie.setMaxAge(0);	//즉시 삭제
cookie2.setMaxAge(0);
cookie3.setMaxAge(0);
cookie4.setMaxAge(0);

response.addCookie(cookie);	//따로 삭제 함수가 없어서 addCookie()를 사용
response.addCookie(cookie2);
response.addCookie(cookie3);
response.addCookie(cookie4);

%>
쿠키가 삭제되었음.<br>

<a href="useCookie.jsp">쿠키 확인</a>
<!-- <a href="useCookie.jsp?id=kim">쿠키확인</a>
 -->

</body>
</html>