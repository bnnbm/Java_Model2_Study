<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/scriptex1.jsp
   ��ũ��Ʈ(Script) ���� : �ڹ� ����
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Script ����</title>
</head>
<body>
<%   //��ũ��Ʈ��(scriptlet)
   String msg = "��ũ��Ʈ ����";
   for(int i=1; i<=10; i++) {
%>
   <%= i + ":" + msg /* ǥ������ ���� �ּ� ���Ұ�. ������ �ּ��� ��� ���� */%><br> 
<%} //for ���� ��%>
<%! //����
   String msg = "�������� ������ msg ����";
   String getMsg() {
	   return msg;
   }
%>
</body>
</html>