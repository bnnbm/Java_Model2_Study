<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/session1.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Session 객체</title>
</head>
<body>
<h2>session 객체 : 브라우저의 상태 정보를 저장하는 객체</h2>
<% session.setMaxInactiveInterval(10); // 10초 세션유지시간 설정 %>
<h3>session 정보</h3>
isNew() : <%=session.isNew()%><br>
생성시간 : <%=session.getCreationTime()%><br>
최종 접속시간 : <%=session.getLastAccessedTime()%><br>
sessionId : <%=session.getId() %>
</body>
</html>