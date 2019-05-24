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
<script type="text/javascript">
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/board/write.jsp";
	});
});

</script>
</head>
<body>
<div class="container-fluid">
<div class="row justify-content-center">
<div class="col col-auto">
<h2>게시판</h2><br>
<button id="btnWrite" class="btn btn-primary">글쓰기</button><br>
</div>
</div>
</div>
<br>
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
	<c:choose>
		<c:when test="${list.show == 'y' }">
		
		<tr>
			<td>${list.num }</td>
			<td>${list.writer }</td>
			<td style="text-align: left;">
				<c:forEach var="i" begin="1" end="${list.re_level }">
					&nbsp;&nbsp;
				</c:forEach>
				<a href="${path }/board_servlet/view.do?num=${list.num}">${list.subject } 
					<c:if test="${list.comment_count > 0 }">
						<label style="color: black">(${list.comment_count })</label>
					</c:if>
				</a>
			</td>
			<td>${list.reg_date }</td>
			<td>${list.readcount }</td>
			<td>
				<c:if test="${list.filesize > 0}">
					<a href="${path }/board_servlet/download.do?num=${list.num}">
						<img alt="파일 이미지" src="../images/file.gif">
					</a>
				</c:if>
				<c:if test="${list.filesize == 0 }">
					-
				</c:if>
			</td>
			<td>${list.down }</td>
		</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<th>${list.num }</th>
				<th colspan="6">삭제된 게시물입니다.</th>
			</tr>
		</c:otherwise>
	</c:choose>
	</c:forEach>
</table>


<!-- 페이지 -->
<br><br>
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
	<br><br><br>
	
</body>
</html>