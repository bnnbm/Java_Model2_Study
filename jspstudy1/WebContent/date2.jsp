<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String day = (String)session.getAttribute("date");
if(day == null || day.length() == 0) {
%>
<script>
   alert("날짜 등록 후 거래하세요 date1.jsp로 갑니다.")
   location.href="date1.jsp";
</script>
<%} else {
	out.println("등록된 날짜 :" + day);
}
session.invalidate();
%>
</body>
</html>