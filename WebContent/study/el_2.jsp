<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_2</title>
</head>
<body>
<%@ page import="java.util.ArrayList" %>

<%
ArrayList<String> list = new ArrayList<>();

list.add("홍길동");
list.add("45세");
list.add("무직");

request.setAttribute("list", list);
%>

<jsp:forward page="el_2_result.jsp"></jsp:forward>

</body>
</html>