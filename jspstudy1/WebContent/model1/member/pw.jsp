<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   request.setCharacterEncoding("euc-kr");
   String id = request.getParameter("id");
   String email = request.getParameter("email");
   String tel = request.getParameter("tel");

   String pass = new MemberDao().search(id,email, tel);
 
   if (pass==null||pass.equals("")) {
%>
<script>
   alert("������ �´� ��й�ȣ�� ã�� �� �����ϴ�.");
   location.href="pwForm.jsp";
</script>
<%
 } else {
  if(pass.length()>3){
   pass =pass.substring(2, pass.length());
   pass = "**"+pass;
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ã��</title>
<script type="text/javascript">
</script>
</head>
<body>
   <h1>��й�ȣ<%=pass%></h1><br>
   <input type="button" value="�ݱ�" onclick="self.close();">
</body>
</html>
<%
 }
%>