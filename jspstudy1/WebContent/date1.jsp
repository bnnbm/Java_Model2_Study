<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
   Date date = new Date();
   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss a");
   String date2 = sf.format(date);
   session.setAttribute("date", date2);
%>
��ϵ� ��¥ : <%=date2 %>

</body>
</html>