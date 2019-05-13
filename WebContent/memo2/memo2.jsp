<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memo2</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(function(){
	list();
	$("#btnSave").click(function(){
		insert();
	});
	$("#btnSearch").click(function(){
		list();
	});
});

function list(){
	var param = "searchkey=" + $("#searchkey").val() + "&search=" + $("#search").val();
	
	$.ajax({
		type : "post",
		url : "${path}/memo_servlet2/list.do",
		data : param,
		success : function(result){
			$("#memo_result").html(result);
		}
	});
}

function insert(){
	var writer = $("#writer").val();
	var memo = $("#memo").val();
	var param = "writer=" + writer + "&memo=" + memo;
	
	$.ajax({
		type : "post",
		url : "${path}/memo_servlet2/insert.do",
		data : param,
		success : function(){
			list();
			$("#writer").val("");
			$("#memo").val("");
		}
	});
}

</script>
<style type="text/css">
body{text-align: center;}
</style>
</head>
<body>

<h2>한줄메모</h2>

<input id="writer" placeholder="이름을 입력하슈" size="50"><br>
<input id="memo" placeholder="메모를 입력하슈" size="100"><br>
<input id="btnSave" type="button" value="저장"><br>
<select id="searchkey">
	<option value="writer">이름</option>
	<option value="memo">메모</option>
	<option value="writer_memo">이름+옵션</option>
</select>   
<input type="text" id="search" value="${search }" placeholder="검색 범위를 선택하고 검색어를 입력하슈" size="50">  
<input type="button" id="btnSearch" value="검색"><br><br>

<div id="memo_result"></div>


</body>
</html>