<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- /WebContent/chap7/join.jsp --%>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="join" class="chap7.Member" />
<jsp:setProperty property="*" name="join" /> <%-- �Էµ��� �Ķ���� ���� setProperty ���� ���ؼ� �����͸� ä������ --%>
<%-- join ��ü�� �Ķ���Ͱ��� ���� ����� ���� --%>
<table border="1" style="border-collapse: collapse";>
<caption>ȸ������</caption>
<tr><td>���̵�</td>
    <td><jsp:getProperty name="join" property="id"/></td></tr>
<tr><td>��й�ȣ</td>
    <td><jsp:getProperty name="join" property="pass"/></td></tr>
<tr><td>�̸�</td>
    <td><jsp:getProperty name="join" property="name"/></td></tr>
<tr><td>����</td>
   <%-- <td><%=join.getGender()==1?"����":"����" %></td></tr> --%>
   <td><jsp:getProperty name="join" property="gender2"/></td></tr>
<tr><td>����</td>
    <td><jsp:getProperty name="join" property="age"/></td></tr>
<tr><td>�̸���</td>
    <td><jsp:getProperty name="join" property="email"/></td></tr>
</table>
</body>
</html>