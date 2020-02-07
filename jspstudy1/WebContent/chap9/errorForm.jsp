<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- 현재페이지에서 에러발생시 error.jsp 페이지로 이동 --%>   
<%@ page errorPage="error.jsp" %>    
<%-- /WebContent/chap9/errorForm.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예외 발생 페이지</title>
</head>
<body>
<%=request.getParameter("name").trim() %>
</body>
</html>