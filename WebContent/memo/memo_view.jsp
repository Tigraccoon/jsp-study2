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
<title>memo_view</title>
<%@include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

function updateMemo(){
	var writer = $("#writer").val();
	if(writer==null){
		alert("수정할 이름을 입력하시오.");
		$("#writer").focus();
		return;
	}
	var memo = $("#memo").val();
	if(memo==null){
		alert("수정할 이름을 입력하시오.");
		$("#memo").focus();
		return;
	}
	
	document.form1.action="${path}/memo_servlet/update.do";
	document.form1.submit();
}

function deleteMemo(){
	if(confirm("삭제하겠냐?")){
		document.form1.action="${path}/memo_servlet/delete.do";
		document.form1.submit();
		
	}
}

</script>
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
<div class="col-xs-6 col-xs-offset-3">
<form method="post" name="form1" id="form1">
<table class="table table-striped">
	<tr>
		<th colspan="2">메모 수정</th>
	</tr>
	<tr>
		<th>번호</th>
		<td><input name="idx" id="idx" value="${dto.idx }" readonly="readonly"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input name="writer" id="writer" type="text" value="${dto.writer }" autofocus="autofocus"></td>
	</tr>
	<tr>
		<th>메모</th>
		<td><input name="memo" id="memo" type="text" value="${dto.memo }" size="50"></td>
	</tr>
	<tr>
		<th>날짜</th>
		<td>${dto.post_date }</td>
	</tr>
	<tr>
		<th colspan="2"><input type="button" class="btn btn-primary" value="수정" onclick="updateMemo()">
						<input type="button" class="btn btn-primary" value="삭제" onclick="deleteMemo()"></th>
	</tr>
</table>
</form>

</div>
</div>
</div>

</body>
</html>