<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteSession.jsp</title>
</head>
<body>

<%
//session.removeAttribute("id");	//세션 변수 삭제
session.invalidate();	//세션 초기화
%>

세션이 삭제되었다.<br>
<a href="viewSession.jsp">세션 확인</a>

</body>
</html>