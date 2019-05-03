<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>h_join_sha</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#btnJoin").click(function(){
		var param = "userid=" + $("#userid").val()
		+ "&passwd=" + $("#passwd").val()
		+ "&name=" + $("#name").val();	//get 전송에서 사용하는 쿼리스트링방식
		
		$.ajax({
			type : "post",
			url : "/jsp02/crypt_servlet/join_sha.do",
			data : param,
			success:function(){
				alert("추가되었습니다~");
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

<h2>회원가입(SHA256 암호화)</h2>
아이디 : <input id="userid"><br><br>
비밀번호 : <input type="password" id="passwd"><br><br>
이름 : <input id="name"><br><br>
<button id="btnJoin">회원가입</button>

</body>
</html>