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
	$("#btnSave").click(function(){
		insert();
	});
	$("#postcodify_search_button").postcodifyPopUp();
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

function insert(){
	var param="userid="+$("#userid").val()
	    +"&passwd="+$("#passwd").val()
	    +"&name="+$("#name").val()
	    +"&email="+$("#email").val()
	    +"&hp="+$("#hp").val()
	    +"&zipcode="+$("#zipcode").val()
	    +"&address1="+$("#address1").val()
	    +"&address2="+$("#address2").val();
	$.ajax({
		type: "post",
		url: "/jsp02/member_servlet/join.do",
		data: param,
		success:function(){
			list();//회원목록 갱신
			//입력값 초기화
			$("#userid").val("");
			$("#passwd").val("");
			$("#name").val("");
			$("#email").val("");
			$("#hp").val("");
			$("#zipcode").val("")
			$("#address1").val("")
			$("#address2").val("");
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
<br><br><br>
<table>
	<tr>
		<th colspan="2">회원가입</th>
	</tr>
	<tr>
		<th>아이디 :</th> 
		<td><input id="userid"></td>
	</tr>
	<tr>
		<th>비밀번호 : </th>
		<td><input type="password" id="passwd"></td>
	</tr>
	<tr>
		<th>이름 : </th>
		<td><input id="name"></td>
	</tr>
	<tr>
		<th>이메일 : </th>
		<td><input id="email"></td>
	</tr>
	<tr>
		<th>핸드폰 : </th>
		<td><input id="hp"></td>
	</tr>
	<tr>
		<th>우편번호 : </th>
		<td><input type="text" id="zipcode" class="postcodify_postcode5" disabled="disabled"/>
<button id="postcodify_search_button">검색</button></td>
	</tr>
	<tr>
		<th>주소 : </th>
		<td><input type="text" id="address1" class="postcodify_address" disabled="disabled"/></td>
	</tr>
	<tr>
		<th>상세주소 : </th> 
		<td><input type="text" id="address2" class="postcodify_details" />
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script></td>
	</tr>
	<tr>
		<th colspan="2"><button type="button" id="btnSave">추가</button></th>
	</tr>
</table>

<br><br><br><hr><br><br><br>

<div id="memberList"></div>

<br><br><br><hr><br><br><br>

<div id="memberAdd"></div>



</body>
</html>