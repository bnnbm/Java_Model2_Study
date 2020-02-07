<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/han.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>한글</title>
</head>
<body>
<%-- POST 방식에서만 유효함. --%>
<% request.setCharacterEncoding("euc-kr"); %>
이름 : <%=request.getParameter("name") %>
주소 : <%=request.getParameter("addr") %>
</body>
</html>