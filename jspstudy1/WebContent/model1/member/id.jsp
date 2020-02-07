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
  alert("정보에 맞는 id를 찾을 수 없습니다.");
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
<title>id 찾기</title>
<script type="text/javascript">
   function sendID(){
	  opener.document.f.id.value="<%=id%>"
	  self.close();
	 }
</script>
</head>
<body>
   <h1>아이디<%=id%></h1>
   <input type="button" value="아이디전송" onclick="sendID()">
</body>
</html>
<%
 }
%>