<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member2_view</title>
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

<form>
<table>
	<tr>
		<th colspan="2">회원관리</th>
	</tr>
	<tr>
		<th>아이디 : </th>
		<td></td>
	</tr>
	<tr>
		<th>비밀번호 : </th>
		<td><input name="passwd" value="<%=%>"></td>
	</tr>
	<tr>
		<th>이름 : </th>
		<td><input name="name" value="<%=%>"></td>
	</tr>
	<tr>
		<th>이메일 : </th>
		<td><input name="email" value="<%=%>"></td>
	</tr>
	<tr>
		<th>전화번호 : </th>
		<td><input name="hp" value="<%=%>"></td>
	</tr>
	<tr>
		<th>우편번호 : </th>
		<td><input name="zipcode" value="<%=%>"></td>
	</tr>
	<tr>
		<th>주소 : </th>
		<td><input name="address1" value="<%=%>"></td>
	</tr>
	<tr>
		<th>상세주소 : </th>
		<td><input name="address2" value="<%=%>"></td>
	</tr>
	<tr>
		<th>가입일 : </th>
		<td></td>
	</tr>
	<tr>
		<th colspan="2">
			<input name="userid" type="hidden" value="<%=%>">
			<button id="btnUpdate">수정</button>
			<button id="btnDelete">삭제</button>
		</th>
	</tr>
</table>

</form>




</body>
</html>