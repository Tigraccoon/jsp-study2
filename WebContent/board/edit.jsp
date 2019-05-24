<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit</title>
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
	<div class="row justify-content-center">
		<div class="col col-auto">
			<h2>글쓰기</h2><br>
			<form action="" name="form1" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<th><label for="writer">이름</label></th>
						<td><input name="writer" id="writer" class="form-control" value="${dto.writer }"></td>
					</tr>
					<tr>
						<th><label for="subject">제목</label></th>
						<td><input name="subject" id="subject" class="form-control" value="${dto.subject }"></td>
					</tr>
					<tr>
						<th><label for="content">본문</label></th>
						<td><textarea rows="5" cols="60" name="content" id="content" class="form-control">${dto.content }</textarea></td>
					</tr>
					<tr>
						<th><label for="file1">첨부파일</label></th>
						<td>
							<c:if test="${dto.filesize > 0 }">
								${dto.filename } (${dto.filesize / 1024 } KB)
								<input type="checkbox" name="fileDel" id="fileDel"> 첨부파일 삭제
								<br>
							</c:if>
							<input type="file" name="file1" id="file1" class="form-control">
						</td>
					</tr>
					<tr>
						<th><label for="passwd">비밀번호</label></th>
						<td><input type="password" name="passwd" id="passwd" class="form-control"></td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="hidden" value="${dto.num }" name="num" id="num">
							<input type="button" value="수정" id="btnUpdate" class="btn btn-primary">
							<input type="button" value="삭제" id="btnDelete" class="btn btn-danger">
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/board_servlet/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		document.form1.action="${path}/board_servlet/delete.do";
		document.form1.submit();
	});	
});

</script>

</body>
</html>