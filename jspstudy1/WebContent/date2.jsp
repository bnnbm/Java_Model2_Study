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
   alert("��¥ ��� �� �ŷ��ϼ��� date1.jsp�� ���ϴ�.")
   location.href="date1.jsp";
</script>
<%} else {
	out.println("��ϵ� ��¥ :" + day);
}
session.invalidate();
%>
</body>
</html>