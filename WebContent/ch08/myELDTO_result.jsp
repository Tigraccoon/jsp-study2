<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myELDTO_result</title>
</head>
<body>

<%@include file="../include/header.jsp" %>

<p>userid : ${dto.userid }</p>
<p>name : ${dto.name }</p>
<p>email : ${dto.email }</p>
<p>hp : ${dto.hp }</p>


</body>
</html>