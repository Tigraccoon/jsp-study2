<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_4</title>
</head>
<body>

<%@ page import="member.MemberDTO" %>
<%@include file="../include/header.jsp" %>

<%
MemberDTO dto = new MemberDTO();

dto.setUserid("gong");
dto.setName("공차");
dto.setEmail("gong@cha.com");
%>

<c:set var="dto" value="<%=dto %>" scope="session" />

<jsp:forward page="el_4_result.jsp"></jsp:forward>

</body>
</html>