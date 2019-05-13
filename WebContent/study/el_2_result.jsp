<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_2_result</title>
</head>
<body>

<%@include file="../include/header.jsp" %>

<c:forEach var="hong" items="${requestScope.list }">
	${hong } <br>
</c:forEach>

</body>
</html>