<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie_login</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	var show = getCookie("showCookies");
	//쿠키이름을 가져와서 팝업창 오픈여부 결정
	console.log(document.cookie);
	if(show == "Y") {//Y일때만 팝업창(popup.jsp)을 연다.
		window.open("popup.jsp", "", "width=300,height=400");
	}
	var cookie_userid = getCookie("userid");
	//id가 userid인 값을 쿠키로 가져옴
	console.log("cookie_userid:"+cookie_userid);
	if (cookie_userid != "") {//빈값이 아니면
		$("#userid").val(cookie_userid);
	//id가 userid에 cookie_userid값을 넣고
	    $("#chkSave").attr("checked", true);
	}
	$("#btnLogin").click(function(){
		if($("#chkSave").is(":checked")){//check가 된 상태이면
			saveCookie($("#userid").val());//saveCookie()호출하면서 id 저장
		}else{//uncheck 상태이면
			saveCookie("");//쿠키 지우기
		}
	});
	$("#chkSave").click(function(){
		if($("#chkSave").is(":checked")){
			if(!confirm("로그인 정보를 저장하시겠습니까?")){
				//!(not)취소버튼을 누르면
				$("#chkSave").prop("checked", false);
			}
		}
	});
});
function saveCookie(id) {
	if(id != "") {//id가 빈값이 아니면
		setCookie("userid", id, 7); //쿠키변수명, 사용자입력id, 7을 리턴
	}else{//id가 빈값이면
		setCookie("userid", id, -1);//쿠키변수명, 사용자입력id, -1(삭제) 리턴
	}
}
function setCookie(name, value, days){
	var today = new Date(); //날짜 객체
	today.setDate(today.getDate() + days);//오늘날짜+7일
	document.cookie = name + "=" + value 
				+ ";path=/jsp02;expires="
				+ today.toGMTString() + ";"; //세계표준시
}
//저장된 쿠키를 검사하는 함수
function getCookie(cname) {
	//userid=kim;expires=... 값이 있을때
	//userid=;expires=...값이 없을때
	var cookie = document.cookie + ";";
	var idx = cookie.indexOf(cname, 0);//문자열값의 위치
	var val = "";
	if (idx != -1) {//idx가 -1이 아니면
		console.log(idx + "," + cookie.length);
	    cookie = cookie.substring(idx, cookie.length);
	    //문자열 자르기(시작인덱스-마지막인덱스)
	    //ex) userid=kim;에서 k라는 값의 위치는 8
	    begin = cookie.indexOf("=", 0)+1; //index는 0부터이기 때문에
	    //정확한 값을 위해 +1을 함
	    end = cookie.indexOf(";", begin); //세미콜론 앞에서 id값을
	    //끊게하기 위해 처리
	    console.log(begin + "," + end);
	    val = cookie.substring(begin, end);
	}
	return val
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

<form method="post" name="form1">

	<table>
		<tr>
			<th>아이디</th>
			<td><input name="userid" id="userid"><input type="checkbox" id="chkSave">아이디 저장</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<th colspan="2"><input type="button" value="로그인" id="btnLogin"></th>
		</tr>
	</table>
</form>



</body>
</html>