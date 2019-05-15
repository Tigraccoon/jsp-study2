<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../bootstrap-4.3.1-dist/css/bootstrap.min.css">
<title>write</title>
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
<%@include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="../bootstrap-4.3.1-dist/js/bootstrap.bundle.min.js"></script>
<script src="../bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
function check(){
	document.form1.action="${path}/guestbook_servlet/insert.do";
	document.form1.submit();
}

</script>
</head>
<body>

<div class="container-fluid">
	<div class="row justify-content-center">
		<div class="col col-auto">
			<h2>방명록 작성</h2>
		</div>
	</div>
	<br>
		<div class="row justify-content-center">
			<div class="col col-auto">
				<form name="form1" id="form1" method="post">
					<table>
						<tr>
							<th><label for="name">이름</label></th>
							<td><input name="name" id="name" class="form-control"></td>
						</tr>
						<tr>
							<th><label for="email">이메일</label></th>
							<td><input type="email" name="email" id="email" class="form-control"></td>
						</tr>
						<tr>
							<th><label for="passwd">비밀번호</label></th>
							<td><input type="password" name="passwd" id="passwd" class="form-control"></td>
						</tr>
						<tr>
							<th colspan="2"><label for="content">내용</label></th>
						</tr>
						<tr>
							<td colspan="2"><textarea rows="5" cols="55" name="content" id="content" class="form-control"></textarea></td>
						</tr>
						<tr>
							<th colspan="2"><input type="button" value="글쓰기" onclick="check()" class="btn btn-success"> 
							<input type="reset" value="초기화" class="btn btn-warning">
							<input type="button" value="돌아가기" class="btn btn-info" onclick="location.href='index.jsp'">
							</th>
						</tr>

					</table>

				</form>

			</div>
		</div>

	</div>


</body>
</html>