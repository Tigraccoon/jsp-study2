<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>h_login_oracle</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnLogin").click(function(){
		var param="userid="+$("#userid").val()
		+"&passwd="+$("#passwd").val();
		$.ajax({
			type: "post",
			url: "/jsp02/crypt_servlet/login_oracle.do",
			data: param,
			success: function(result){
				$("#result").html(result);
			}
		});
	});
});
</script>
</head>
<body>
<h2>로그인(오라클 암호화)</h2>
아이디 : <input id="userid"><br><br>
비번 : <input type="password" id="passwd"><br><br>
<button id="btnLogin">로그인</button><br><br>
<div id="result"></div>
</body>
</html>