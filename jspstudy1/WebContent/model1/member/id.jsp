<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/member/id.jsp --%>
<%
   request.setCharacterEncoding("euc-kr");
   String email = request.getParameter("email");
   String tel = request.getParameter("tel");
   String id = new MemberDao().find(email,tel);
   
   if(id==null || id.equals("")) {
%>
<script>
  alert("������ �´� id�� ã�� �� �����ϴ�.");
  location.href="idForm.jsp";
</script>
<%
  } else {
  if(id.length()>3){
   id = id.substring(0, id.length()-2)+"**";
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>id ã��</title>
<script type="text/javascript">
   function sendID(){
	  opener.document.f.id.value="<%=id%>"
	  self.close();
	 }
</script>
</head>
<body>
   <h1>���̵�<%=id%></h1>
   <input type="button" value="���̵�����" onclick="sendID()">
</body>
</html>
<%
 }
%>