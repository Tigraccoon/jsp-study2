<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01</title>
</head>
<body>
<%--
<h3>자바 코드</h3> 
<%@ page import="java.util.Enumeration" %>

<%
//request.getHeaderNames()는 일반 for문으로 못 돌리기 때문에 열거형인 Enumeration과 while로 처리
Enumeration<String> headerNames = request.getHeaderNames();

while(headerNames.hasMoreElements()){	//다음 요소가 있으면?
	String key = (String)headerNames.nextElement();	//값을 읽음
	String value = request.getHeader(key);	//헤더값 조회
	
	out.println("Key : " + key + "  /  Value : " + value + "<br>");
	
}
%>
--%>

<br><br><hr><br><br>

<h3>JSTL코드</h3>
<!-- taglib prefix="접두사" uri="태그의 식별자" -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="h" items="${header }">
	Key : ${h.key }  /  Value : ${h.value }<br>
</c:forEach>

<br><br><hr><br><br>

<c:set var="browser" value="${header['user-agent'] }" scope="page"/>
<c:out value="${browser }" />
<!-- <c:out value="" />은  ${browser} 와 같다. -->

<c:remove var="browser"/>
<c:out value="browser" />

</body>
</html>