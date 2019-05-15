<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../bootstrap-4.3.1-dist/css/bootstrap.min.css">
<title>edit</title>
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
function gb_update(){
	var form1 = $("#form1");
	var name = $("#name");
	var email = $("#email");
	var passwd = $("#passwd");
	var content = $("#content");
	if(name.val() == ""){
		alert("이름을 입력하셍");
		name.focus();
		return;
	}
	if(email.val() == ""){
		alert("이메일을 입력하셍");
		email.focus();
		return;
	}
	if(passwd.val() == ""){
		alert("비밀번호를 입력하셍");
		passwd.focus();
		return;
	}
	if(content.val() == ""){
		alert("내용을 입력하셍");
		content.focus();
		return;
	}
	
	document.form1.action="${path}/guestbook_servlet/update.do";
	document.form1.submit();
}

function gb_delete(){
	if(confirm("진짜 삭제??")){
		document.form1.action="${path}/guestbook_servlet/delete.do";
		document.form1.submit();
	}
}

</script>
</head>
<body>

<div class="container-fluid">
	<div class="row justify-content-center">
		<div class="col col-auto">
			<h2>방명록 수정</h2>
		</div>
	</div>
		<div class="row justify-content-center">
			<div class="col col-auto">
				<form name="form1" id="form1" method="post">
					<table>
						<tr>
							<th><label for="name">이름</label></th>
							<td><input name="name" id="name" value="${dto.name }" class="form-control"></td>
						</tr>
						<tr>
							<th><label for="email">이메일</label></th>
							<td><input type="email" name="email" id="email" value="${dto.email }" class="form-control"></td>
						</tr>
						<tr>
							<th><label for="passwd">비밀번호</label></th>
							<td><input type="password" name="passwd" id="passwd" class="form-control"></td>
						</tr>
						<tr>
							<th colspan="2"><label for="content">내용</label></th>
						</tr>
						<tr>
							<td colspan="2">
							<textarea rows="5" cols="55" name="content" id="content" class="form-control">${dto.content }</textarea>
							</td>
						</tr>
						<tr>
							<th colspan="2">
							<input type="button" value="수정" onclick="gb_update()" class="btn btn-primary"> 
							<input type="button" value="삭제" onclick="gb_delete()" class="btn btn-danger"> 
							<input type="button" value="목록" onclick="location.href='index.jsp'" class="btn btn-info">
							<input type="hidden" value="${dto.idx }" name="idx"> 
							</th>
						</tr>
					</table>
				</form>
		</div>
	</div>





</body>
</html>