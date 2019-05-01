<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_add</title>

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
<script type="text/javascript">
function check(){
	var userid = document.getElementById("userid").value;
	var passwd = document.getElementById("passwd").value;
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var hp = document.getElementById("hp").value;
	var zipcode = document.getElementById("zipcode").value;
	var address1 = document.getElementById("address1").value;
	var address2 = document.getElementById("address2").value;
	
	if(userid==""){	
		alert("아이디를 입력해주세요!");
		document.getElementById("userid").focus();	
		return;		
	}
	if(passwd==""){	
		alert("비밀번호를 입력해주세요!");
		document.getElementById("passwd").focus();	
		return;		
	}
	if(name==""){	
		alert("이름을 입력해주세요!");
		document.getElementById("name").focus();	
		return;		
	}
	if(email==""){	
		alert("이메일을 입력해주세요!");
		document.getElementById("email").focus();	
		return;		
	}
	if(hp==""){	
		alert("전화번호를 입력해주세요!");
		document.getElementById("hp").focus();	
		return;		
	}
	if(zipcode==""){	
		alert("우편번호를 입력해주세요!");
		document.getElementById("zipcode").focus();	
		return;		
	}
	if(address1==""){	
		alert("주소1을 입력해주세요!");
		document.getElementById("address1").focus();	
		return;		
	}
	if(address2==""){	
		alert("주소2를 입력해주세요!");
		document.getElementById("address2").focus();	
		return;		
	}
	
	if (confirm("회원가입?") == true){
		alert("가입합니다.");
		document.getElementById("form").submit();
	} else{
		alert("취소하셨습니다.");
	}
}

</script>
</head>
<body>
<%String context = request.getContextPath(); %>
<form action="<%=context %>/member_servlet/add.do" method="post" id="form">
<table>
	<tr>
		<th colspan="2">회원가입</th>
	</tr>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="userid" id="userid"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="text" name="passwd" id="passwd"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="email" name="email" id="email"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="tel" name="hp" id="hp"></td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td><input type="text" name="zipcode" id="zipcode"></td>
	</tr>
	<tr>
		<th>주소1</th>
		<td><input type="text" name="address1" id="address1"></td>
	</tr>
	<tr>
		<th>주소2</th>
		<td><input type="text" name="address2" id="address2"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="button" value="가입!" onclick="check()"></td>
	</tr>
</table>
</form>

</body>
</html>