<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_3</title>
</head>
<body>

<%@ page import="java.util.HashMap" %>

<%
HashMap<String, String> map = new HashMap<>();

map.put("name", "홍길동");
map.put("age", "67세");
map.put("job", "none");

request.setAttribute("map", map);

%>

<jsp:forward page="el_3_result.jsp"></jsp:forward>

</body>
</html>