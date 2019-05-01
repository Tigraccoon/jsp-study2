<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="member2.Member2DTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member2_list</title>
</head>
<body>
<%
Map<String,Object> map = (Map<String,Object>)request.getAttribute("map");
List<Member2DTO> list = (List<Member2DTO>)map.get("list");
int count = (int)map.get("count");
%>

<table>
	<caption style="text-align: right;"><%=count %></caption>
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>이메일</th>
		<th>전화번호</th>
		<th>우편번호</th>
		<th>주소</th>
		<th>상세주소</th>
		<th>가입일</th>
	</tr>
	<%for(Member2DTO dto : list){ %>
	<tr>
		<td><%=dto.getUserid() %></td>
		<td><%=dto.getPasswd() %></td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getEmail() %></td>
		<td><%=dto.getHp() %></td>
		<td><%=dto.getZipcode() %></td>
		<td><%=dto.getAddress1() %></td>
		<td><%=dto.getAddress2() %></td>
		<td><%=dto.getJoin_date() %></td>
	</tr>
	<%} %>
</table>


</body>
</html>