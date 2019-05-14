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
<title>memo</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
function insert(){
	var writer=$("#writer").val();
	var memo=$("#memo").val();
	var param="writer="+writer+"&memo="+memo;
	$.ajax({
		type: "post",
		url: "${path}/memo_servlet/insert.do",
		data: param,
		success: function(){
			list();
			$("#writer").val("");
			$("#memo").val("");
		}
	});
}

function list(){
	var param = "searchkey=" + $("#searchkey").val()
	+ "&search=" + $("#search").val();
	$.ajax({
		type : "post",
		url : "${path}/memo_servlet/list.do",
		data : param,
		success : function(result){
			$("#result").html(result);
		}
	});
}
</script>
<style type="text/css">
body{text-align: center;}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-xs-4 col-xs-offset-4" style="background: white;">
			<h2>한줄메모장</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6 col-xs-offset-3">
			<br>
			<div class="input-group input-group-lg">
				<span class="input-group-addon">이름 </span> 
				<input id="writer" size="10" class="form-control">
			</div>
			<div class="input-group input-group-lg">
				<span class="input-group-addon">메모 </span>
				<input id="memo" size="40" class="form-control">
			</div><br>
			<button id="btnSave" class="btn btn-primary"><span class="glyphicon glyphicon-saved"></span> 확인</button>
			<br><hr><br>
			<div class="input-group input-group-md">
				<span class="input-group-addon">
					<select id="searchkey">
						<option value="writer">이름</option>
						<option value="memo">메모</option>
						<option value="writer_memo">이름+옵션</option>
					</select>   
				</span>
				<input id="search" class="form-control" value="${search }" placeholder="검색 범위를 선택하고 검색어를 입력하세요." size="40">  
			<br>
			</div>
			<br>
			<button id="btnSearch" value="검색" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span> 검색</button>
		</div>
	</div>
<br>
<div id="result" class="col-xs-8 col-xs-offset-2"></div>
</div>
</body>
</html>