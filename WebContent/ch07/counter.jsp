<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="common.Util" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>counter</title>
</head>
<body>

<%
//쿠키 변수 count 값 조회
//request.getCookies() : 쿠키 배열
String count = Util.getCookie(request.getCookies(), "count");

Date date = new Date();	//날짜 객체
long now_time = date.getTime();	//현재 시각(1970.01.01부터 현재까지의 초)
String visitTime = Util.getCookie(request.getCookies(), "visit_time");
long visit_time = 0;

//visitTime 값이 null이거나 ""이 아니면? 즉 값이 있으면
if(visitTime != null && !visitTime.equals("")){
	visit_time = Long.parseLong(visitTime);
}

out.println("현재 시각 : " + now_time + "<br>" );
out.println("방문 시각 : " + visit_time + "<br>");

int intCount = 1;

if(count == null || count.equals("")){	//첫 방문일 경우
	//쿠키 변수 생성
	response.addCookie(new Cookie("count", "1"));
	//첫 방문시간 지정
	response.addCookie(new Cookie("visit_time", Long.toString(now_time)));


} else {	//재방문일 경우
	//방문시간 변경
	long period = now_time - visit_time; 
	intCount = Integer.parseInt(count)+1;
	
	if(period > 3*1000){	
		//일정 시간(3초)이 경과하면 카운터 수정(실제 조회수 같은 처리는 (period > 24*60*60*1000)와 같이 하루에 한 번만 카운팅되게 사용)
		
		//카운트값 변경
		response.addCookie(new Cookie("count",Integer.toString(intCount)));
		//방문 시간 업데이트
		response.addCookie(new Cookie("visit_time", Long.toString(now_time)));
	}
	
	
}

//Integer.toString(숫자) 숫자를 문자열로
//문자열.charAt(i) : 문자열의 i번째 문자 리턴

String counter = Integer.toString(intCount);


for(int i=0; i<counter.length(); i++){
	String img = "<img src='../images/" + counter.charAt(i)+ ".gif'>";
	out.println(img);
}

%>

방문횟수 : <%=intCount %>

</body>
</html>