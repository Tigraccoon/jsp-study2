<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join_bcrypt</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#btnJoin").click(function(){
		var param = "userid=" + $("#userid").val()
		+ "&passwd=" + $("#passwd").val()
		+ "&name=" + $("#name").val();	//get 전송에서 사용하는 쿼리스트링방식
		
		$.ajax({
			type : "post",
			url : "/jsp02/member_servlet/join_bcrypt.do",
			data : param,
			success:function(){
				alert("추가됐다~");
				$("#userid").val("");
				$("#passwd").val("");
				$("#name").val("");
			}
		});
		
	});
	
});

</script>
<style type="text/css">

body{
	text-align: center;
}

</style>
</head>
<body>

<h2>회원가입(Bcrypt 암호화)</h2>
아이디 : <input id="userid"><br><br>
비밀번호 : <input type="password" id="passwd"><br><br>
이름 : <input id="name"><br><br>
<button id="btnJoin">회원가입</button>

</body>
</html>