<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/application1.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>application ����</title>
</head>
<body>
<h3>application ��ü�� �����ø����̼� �� �Ѱ��� ��ü�� �����˴ϴ�.<br>
���� chap5 ������Ʈ�� ��� jsp�� �ϳ��� application ��ü�� �����ϰ� �ֽ��ϴ�.
</h3>
<table border="1" style="border-collapse: collapse;">
   <tr><td>jsp ����</td>
       <td><%=application.getMajorVersion() %>.
           <%=application.getMinorVersion() %></td></tr>
   <tr><td>�����̳� ����</td>
       <td><%=application.getServerInfo() %></td></tr>
   <tr><td>�����ø����̼� ���</td>
       <td><%=application.getRealPath("/") %></td></tr>
</table>
<% application.setAttribute("test","application ��ü�� test �Ӽ�"); %>
</body>
</html>