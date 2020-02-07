<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/currentTime.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>현재 시간</title>
</head>
<body>
<%
   java.util.Calendar c = java.util.Calendar.getInstance();
   int h = c.get(java.util.Calendar.HOUR_OF_DAY);
   int m = c.get(java.util.Calendar.MINUTE);
   int s = c.get(java.util.Calendar.SECOND);
%>
<h1>현재시간은 <%=h %>시 <%=m %>분 <%=s %>초 입니다.</h1>
</body>
</html>