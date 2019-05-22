<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comment_list</title>
<%@include file="../include/header.jsp" %>
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
	width: 1000px;
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
	<div class="row justify-content-center">
		<div class="col col-auto">
			<table>
				<tr>
					<th colspan="3">댓글</th>
				</tr>
				<c:forEach var="row" items="${list }">
				<tr>
					<th width="10%">${row.writer }</th>
					<td width="70%">${row.content }</td>
					<th width="20%">(<fmt:formatDate value="${row.reg_date }" pattern="yyyy-MM-dd hh:mm:ss E"/>)</th>
				</tr>
				
				</c:forEach>
			
			</table>
			
		</div>
	</div>
</div>



</body>
</html>