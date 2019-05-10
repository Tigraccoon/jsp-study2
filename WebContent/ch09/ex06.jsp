<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06</title>
</head>
<body>

<%
Date date = new Date();
out.println(date + "<Br>");
%>

<c:set var="date" value="<%=date %>" />
${date } <br>

<fmt:formatDate value="${date }"/><br>
<fmt:formatDate value="${date }" type="date"/><br>
<fmt:formatDate value="${date }" type="time"/><br>
<fmt:formatDate value="${date }" pattern="yyyy-MM-dd HH:mm:ss E"/><br>
<!-- 날짜 포맷으로 원하는 형식의 날짜를 표현 가능 -->
<br><br><hr><br><br>
<!-- 숫자 -->

<c:set var="num" value="123456789.1523456"/>
${num }<br>

<!-- 천단위 컴마 -->
<fmt:formatNumber value="${num }" groupingUsed="true"/><br>
<!-- 쉼표 위치 조정 -->
<fmt:formatNumber value="${num }" pattern="#,####.##"/><br>
<!-- 소수점 이하의 값이 없으면 0으로 채움 -->
<fmt:formatNumber value="${num}" pattern="##,###.000"/><br>


</body>
</html>