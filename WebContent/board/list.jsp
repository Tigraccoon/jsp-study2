<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
body{
	background: #cccccc;
	text-align: center;
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
	
<table>
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>제목</th>
		<th>날짜</th>
		<th>조회수</th>
		<th>첨부파일</th>
		<th>다운로드</th>
	</tr>
	<c:forEach var="list" items="${list }">
		<tr>
			<td>${list.num }</td>
			<td>${list.writer }</td>
			<td>${list.subject }</td>
			<td>${list.reg_date }</td>
			<td>${list.readcount }</td>
			<td>${list.filename }</td>
			<td>${list.down }</td>
		</tr>
	</c:forEach>

	</table>
	
	
</body>
</html>