<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myELHashMap_result</title>
</head>
<body>

<%@include file="../include/header.jsp" %>

<c:forEach var="map" items="${map }">
	${map.key } : ${map.value }<br>
</c:forEach>


</body>
</html>