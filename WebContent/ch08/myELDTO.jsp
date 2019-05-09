<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myELDTO</title>
</head>
<body>

<%@ page import="member.MemberDTO" %>
<%
MemberDTO dto = new MemberDTO();

dto.setUserid("park");
dto.setName("박철수");
dto.setEmail("park@olympicpark.com");
dto.setHp("010-0000-1234");

request.setAttribute("dto", dto);
%>

<jsp:forward page="myELDTO_result.jsp"></jsp:forward>

</body>
</html>