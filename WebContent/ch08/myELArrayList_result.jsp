<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myELArrayList_result</title>
</head>
<body>

<%@include file="../include/header.jsp" %>

<c:forEach var="items" items="${list }">
	${items } <br>
</c:forEach>


</body>
</html>