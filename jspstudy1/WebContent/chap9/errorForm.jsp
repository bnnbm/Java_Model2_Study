<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- �������������� �����߻��� error.jsp �������� �̵� --%>   
<%@ page errorPage="error.jsp" %>    
<%-- /WebContent/chap9/errorForm.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �߻� ������</title>
</head>
<body>
<%=request.getParameter("name").trim() %>
</body>
</html>