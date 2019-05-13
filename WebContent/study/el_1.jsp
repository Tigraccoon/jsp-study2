<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_1</title>
</head>
<body>
<%@include file="../include/header.jsp" %>

<c:set var="name" value="홍길동" scope="session" />
<c:set var="age" value="55" scope="session" />
<c:set var="job" value="백수" scope="session" />

<a href="el_1_result.jsp">전송</a>

</body>
</html>