<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/book.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
</head>
<body>
<%
   request.setCharacterEncoding("euc-kr");
   String name = request.getParameter("name");
   String title = request.getParameter("title");
   String text = request.getParameter("text");
   Date today = new Date();
   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
   <p>����</p>
   <table border ="1">
   <tr><td>�湮��</td>
   <td><%=name %></td></tr>
   <tr><td>����</td>
   <td><%=title %></td></tr>
   <tr><td>����</td>
   <td><%=text %></td></tr>
   <tr>
   <td>�����</td>
   <td><%=sf.format(today) %></td></tr>
</table>
</body>
</html>