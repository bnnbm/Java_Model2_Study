<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- /WebContent/includedirective1.jsp --%> 
<html>
<head>
<meta charset="EUC-KR">
<title>Include ���þ�</title>
</head>
<body>
<%
   String msg = "includedirective1.jsp ��������  msg ����";
%>
<h1>includedirective1.jsp �Դϴ�.</h1>
<%@ include file="includedirective2.jsp" %>
<h2>include Directive(���þ�)�� �ٸ� �������� ������ �� �ֽ��ϴ�.
   ���� �ΰ��� jsp�� ���� �������� ��ȯ�ǹǷ� ������ ������ �� �ֽ��ϴ�.</h2>
</body>
</html>