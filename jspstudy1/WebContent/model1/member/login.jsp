<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/login.jsp 
   1. id에 해당하는 정보를 db에서 조회
   2. 내용이 존재하면 비밀번호 검증
        -> db의 비밀번호와 입력된 비밀번호를 확인
                   맞는 경우 : session 로그인 정보 등록. 확인 메세지 출력.
                   => main.jsp로 페이지 이동
                   비밀번호가 틀린 경우 : '비밀번호가 틀립니다' 메세지 출력
                   =>loginForm.jsp로 페이지 이동
      id가 없으면 화면에 '아이디를 확인하세요' 메세지 출력
      => loginForm.jsp로 페이지 이동
--%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
<%
   String id = request.getParameter("id");
   String pass = request.getParameter("pass");
   //MemberDao 클래스 : Model 담당 클래스
   //Model : dbms와 연관있는 기능을 가진 클래스
   Member mem = new MemberDao().selectOne(id);
   if(mem != null) { // id 존재
      if(pass.equals(mem.getPass())) { //비밀번호가 맞는경우. 로그인 성공
          session.setAttribute("login", id);
%>
<script type="text/javascript">
   alert("<%=mem.getName()%>님이 로그인 하셨습니다.");
   location.href='main.jsp';
</script>
<%   
       } else { //id는 맞지만 비밀번호가 틀린 경우
%>
<script type="text/javascript">
   alert("비밀번호가 틀립니다");
   location.href='loginForm.jsp';
</script>   
<% 	   
       }
   } else { // id가 없는 경우
%>
<script type="text/javascript">
   alert("아이디를 확인하세요");
   location.href='loginForm.jsp';
</script>   
<%} %>
</body>
</html>