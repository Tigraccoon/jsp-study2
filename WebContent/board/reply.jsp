<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<%@include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
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
			<h2>답변쓰기</h2><br>
			<form action="${path}/board_servlet/insertReply.do" name="form1" method="post">
				<table>
					<tr>
						<th><label for="writer">이름</label></th>
						<td><input name="writer" id="writer" class="form-control"></td>
					</tr>
					<tr>
						<th><label for="subject">제목</label></th>
						<td><input name="subject" id="subject" class="form-control" value="Re: ${dto.subject }"></td>
					</tr>
					<tr>
						<th><label for="content">본문</label></th>
						<td><textarea rows="5" cols="60" name="content" id="content" class="form-control">
							${dto.content }
						</textarea></td>
					</tr>
					<tr>
						<th><label for="file1">첨부파일</label></th>
						<td><input type="file" name="file1" id="file1" class="form-control"></td>
					</tr>
					<tr>
						<th><label for="passwd">비밀번호</label></th>
						<td><input type="password" name="passwd" id="passwd" class="form-control"></td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="hidden" name="num" value="${dto.num }">
							<input type="button" value="글쓰기" id="btnSave" class="btn btn-primary">
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	$("#btnSave").click(function(){
		document.form1.submit();
	});
	
});

</script>

</body>
</html>