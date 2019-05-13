<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memo_list</title>
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

<table>
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th width="50%">메모</th>
		<th>날짜</th>
	</tr>
	<c:forEach var="row" items="${list }">
	<tr>
		<td>${row.idx }</td>
		<td>${row.writer }</td>
		<td>${row.memo }</td>
		<td>${row.post_date }</td>
	</tr>
	</c:forEach>
</table>


</body>
</html>