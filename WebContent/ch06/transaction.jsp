<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="emp.EmpDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>transaction</title>
</head>
<body>

<%
EmpDAO dao = new EmpDAO();
dao.insert_batch();
%>

</body>
</html>