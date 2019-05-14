<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>memo_list</title>
<%@include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
<div class="container-fluid">
<div class="row">
<div class="col-xs-8 col-xs-offset-2">
<table class="table table-striped">
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
		<td><a href="${path}/memo_servlet/view.do?idx=${row.idx}">${row.memo }</a></td>
		<td>${row.post_date }</td>
	</tr>
	</c:forEach>
</table>

</div>
</div>
</div>

</body>
</html>