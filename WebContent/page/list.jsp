<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
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
	width: 800px;
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
		<th>사번</th>
		<th>이름</th>
	</tr>
	<c:forEach var="row" items="${list }">
		<tr>
			<td>${row.empno }</td>
			<td>${row.ename }</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="2">
			<c:if test="${page.curPage > 1 }">
				<a href="#" class="btn btn-primary" onclick="list('1')">처음</a>
			</c:if>
			<c:if test="${page.curBlock > 1}">
        <a href="#" onclick="list('${page.prevPage}')" class="btn btn-primary">이전</a>
      </c:if>
			<c:forEach var="num" begin="${page.blockStart }" end="${page.blockEnd }">
				<c:choose>
					<c:when test="${num == page.curPage }">
						<span class="btn btn-success disabled"><b>${num }</b></span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')" class="btn btn-outline-info"><b>${num }</b></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.curBlock < page.totBlock }">
				<a href="#" onclick="list('${page.nextPage}')" class="btn btn-primary">다음</a>
			</c:if>
			<c:if test="${page.curPage < page.totPage}">
				<a href="#" onclick="list('${page.totPage}')" class="btn btn-primary">끝</a>
			</c:if>
		</td>
	</tr>
</table>


</body>
</html>