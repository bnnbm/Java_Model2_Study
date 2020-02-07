<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /jspstudy2/WebContent/el/elEx2.jsp 
   EL(ǥ�����) : ��ũ��Ʈ�� ǥ���� ��ü ���.
                ${��}
                            �������� ǥ�� ����. => �Ӽ��̳� �Ķ���͸� ǥ�� ����
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>elEx1.jsp�� ��� ȭ��</title>
</head>
<body>
<%
   request.setCharacterEncoding("euc-kr");
   String tel = "010-1111-2222";
   pageContext.setAttribute("tel", tel);
   pageContext.setAttribute("test", "pageContext ��ü�� test �Ӽ���");
   request.setAttribute("test", "request ��ü�� test �Ӽ���");
   application.setAttribute("test", "application ��ü�� test �Ӽ���");
%>
<h3>JSP�� ��ũ��Ʈ�� �̿��Ͽ� �Ķ���Ϳ� �Ӽ��� ���</h3>
pageContext test �Ӽ��� : <%=pageContext.getAttribute("test") %><br>
session test �Ӽ��� : <%=session.getAttribute("test") %><br>
today �Ӽ��� : <%=pageContext.getAttribute("today") %><br>
name �Ķ���Ͱ� : <%=request.getParameter("name") %><br>
tel ������: <%=tel %><br>
tel �Ӽ��� : <%=pageContext.getAttribute("tel") %><br>
noAttr �Ӽ��� : <%=pageContext.getAttribute("noAttr") %><br>
noparam �Ķ���Ͱ� : <%=request.getParameter("noparam") %><br><br>

<h3>JSP�� EL(ǥ��)�� �̿��Ͽ� �Ķ���Ϳ� �Ӽ��� ���</h3>
pageContext test �Ӽ��� : ${test}<br>
session test �Ӽ��� : ${sessionScope.text}<br>
today �Ӽ��� : ${today}<br>
name �Ķ���Ͱ� : ${param.name}<br>
tel ������: EL�� ǥ�� ����. <%=tel%><br>
tel �Ӽ��� : ${tel}<br>
noAttr �Ӽ��� : ${noAttr}<br>
noparam �Ӽ��� : ${param.noparam}<br> <%-- el�� ǥ���ϸ� null�� �ƴ϶� ��������� �� --%>
<br>
<h3>������ �����Ͽ� test �Ӽ��� ���</h3>
\${test}=${test}<br>
\${pageScope.test}=${pageScope.test}<br>
\${requestScope.test}=${requestScope.test}<br>
\${sessionScope.test}=${sessionScope.test}<br>
\${applicationScope.test}=${applicationScope.test}<br>
\${requestScope.today}=${requestScope.today}<br>
</body>
</html>
<%--
   ${test} : ������� ��ü�� ����� �Ӽ� �� �̸��� test�� ���� ����
      page ���� : pageContext
      request ���� : request
      session ���� : session
      application ���� : application
      
   1. pageContext ��ü�� ��ϵ� �Ӽ��� �̸��� test�� �Ӽ��� ���� ����
   2. 1���� �ش��ϴ� �Ӽ��� ���� ��� request ��ü�� ��ϵ� �Ӽ��� �̸��� test�� �Ӽ��� ���� ����
   3. 2���� �ش��ϴ� �Ӽ��� ���� ��� session ��ü�� ��ϵ� �Ӽ��� �̸��� test�� �Ӽ��� ���� ����
   4. 3���� �ش��ϴ� �Ӽ��� ���� ��� application ��ü�� ��ϵ� �Ӽ��� �̸��� test�� �Ӽ��� ���� ����
   5. 4���� �ش��ϴ� �Ӽ��� ���� ��� null�� �ƴ� �ƹ��͵� ������� ����. �����߻��� ����
   
   - ���� ���� ��� ��ü�� �����Ͽ� ����ϱ�
      pageContext ��ü�� �Ӽ� : ${pageScope.test}
      request ��ü�� �Ӽ� : ${requestScope.test}
      session ��ü�� �Ӽ� : ${sessionScope.test}
      application ��ü�� �Ӽ�  : ${applicationScope.test}
--%>