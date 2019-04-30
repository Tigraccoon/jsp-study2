<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(function(){	//페이지 로딩시 함수 자동 실행
	list();	//list() 호출
	add();
});

function list(){
	$.ajax({
		type : "post",
		url : "/jsp02/member_servlet/list.do",
		success : function(result){
			console.log(result);	//F12 console에서 응답 text확인
			$("#memberList").html(result);
		}
	});
}

function add(){
	$.ajax({
		type : "post",
		url : "/jsp02/ch06/member_add.jsp",
		success : function(result){
			console.log(result);	//F12 console에서 응답 text확인
			$("#memberAdd").html(result);
		}
	});
}

</script>


<style type="text/css">

body{
	text-align: center;
}

div{
	background: white;
	padding: 100px;
}

</style>
</head>
<body>

<h2>회원 관리</h2>
<div id="memberList"></div>
<br><br><br><hr><br><br><br>
<div id="memberAdd"></div>




</body>
</html>