<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
	1) JSTL(JSP Standard Tag Library) : JSP 표준 태그 라이브러리
	2) JSTL 사용 이유 : Model1은 jsp페이지 중심, Model2는 javacode 중심(서블릿, 모델) 중심. 
		JSP웹페이지에선 java초드를 안 쓸수는 없지만 이를 최소화 하기 위해 JSTL, EL기법을 씀.
		즉, JSP 내부의 복잡한 자바 코드들을 대체하기 위한 태그
	3) TagLib Prefix = "태그 접두어" uri = "태그라이브러리 식별자"
	4) Core Tag(핵심 태그, 제일 자주 사용되는 태그들) -> 태그 접두어로 접근
		ex) prefix = "c"
 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>      
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<!-- :set var="변수명" value="값" -->
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- 위와 같은 코드를 워낙 자주 사용하니 header에 넣고 include시켜서 사용 -->
<%-- <% String path = request.getContextPath(); %>
<%=path %>
 --%>
