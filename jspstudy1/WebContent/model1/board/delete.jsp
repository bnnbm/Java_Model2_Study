<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%-- /WebContent/model1/board/deleteForm.jsp 
   1. num, pass �Ķ���͸� ������ ����
   2. �Էµ� ��й�ȣ�� db ��й�ȣ ����
           Ʋ����� : ��й�ȣ ���� �޼��� ���, deleteForm.jsp ������ �̵�
   3. ��й�ȣ�� �´� ��� : �Խù� ����.
           ���� ���� : ���� ���� �޼��� ���, list.jsp ������ �̵�
           ���� ���� : ���� ���� �޼��� ���, info.jsp ������ �̵�
--%>
<%
   
   int num = Integer.parseInt(request.getParameter("num"));
   String pass = request.getParameter("pass");    //�Ķ���� ������ ����(�ԷµȰ�)
   String msg = "��й�ȣ ���� �Դϴ�.";;
   String url = "deleteForm.jsp?num="+num;
   BoardDao dao = new BoardDao();    // db�� �ִ� ���� �ޱ�
   Board dbBoard = dao.selectOne(num);
   
   if(dbBoard == null) {
	   msg ="���� �Խñ��Դϴ�.";
	   url = "list.jsp";
   } else {   
   if(pass.equals(dbBoard.getPass())) {
	   if(dao.delete(num)) {
		   msg = "���� ����";
		   url = "list.jsp";
	   } else {
		   msg = "���� ����";
		   url = "info.jsp?num="+num;
	   }
   }
}      
%>
<script>
   alert("<%=msg%>");
   location.href = "<%=url%>";
</script>