<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_3_result</title>
</head>
<body>

<%@include file="../include/header.jsp" %>
${map.name }
${map.age }
${map.job }

<br><br>
<c:forEach var="items" items="${map }">
	${items.key } = ${items.value }
</c:forEach>

</body>
</html>