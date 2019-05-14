<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<%@include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<style type="text/css">
body{
	background: #cccccc;
}
table{
	background : white;
	border-collapse: collapse;
	border-spacing: 0;
	border: 2px solid black;
	margin: auto;
	width: 600px;
}
th, td{
	padding: 10px;
	text-align: center;
	vertical-align: middle;
	border: 0.3px solid black;
}
th{
	background: #8BB7FF;
}
</style>
</head>
<body>

<h2>방명록</h2>

<form action="" method="post">
<c:forEach var="dto" items="${list }">
<table>
	<caption>게시물 갯수 : ${count }</caption>
	<tr>
		<th>이름</th>
		<td>${dto.name }</td>
		<th>날짜</th>
		<td>${dto.post_date }</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td colspan="3">${dto.email }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="3">${dto.content }</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td colspan="3"><input type="password" name="passwd"><input type="submit" value="수정/삭제"></td>
	</tr>
	
		
	
</table>
</c:forEach>
</form>


</body>
</html>