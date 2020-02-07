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
   alert("정보에 맞는 비밀번호를 찾을 수 없습니다.");
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
<title>비밀번호 찾기</title>
<script type="text/javascript">
</script>
</head>
<body>
   <h1>비밀번호<%=pass%></h1><br>
   <input type="button" value="닫기" onclick="self.close();">
</body>
</html>
<%
 }
%>