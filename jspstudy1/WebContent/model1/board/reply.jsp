<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- /WebContent/model1/board/reply.jsp : ��� ���
   1. �Ķ���� ���� Board ��ü�� �����ϱ� =>useBean �±� ���
      �������� : num, grp, grplevel, grpstep
      ������� : name, pass, subject, content
   2. ���� grp ���� ����ϴ� �Խù����� grpstep ���� 1 ���� �ϱ�.
      void BoardDao.grpStepAdd(num,grpstep)
   3. Board ��ü�� db�� insert �ϱ�.
      num : maxnum + 1
      grp : ���۰� ����.
      grplevel : ���� + 1
      grpstep : ���� + 1
   4. ��� ������ : "�亯��� �Ϸ� �޼��� �����, list.jsp ������ �̵�
           ��� ���н� : "�亯��Ͻ� �����߻�" �޽��� ��� ��, replyForm.jsp ������ �̵��ϱ�
--%>
<%
   request.setCharacterEncoding("euc-kr");%>
   <jsp:useBean id="b" class="model.Board" />
   <jsp:setProperty name="b" property="*" />
<%
   BoardDao dao = new BoardDao();
   //2. ���� grp���� ����ϴ� �Խù����� grpstep ���� 1���� ��Ű��
   dao.grpStepAdd(b.getGrp(), b.getGrpstep());
   //3. Board ��ü�� db�� insert �ϱ�.
   int grplevel = b.getGrplevel();
   int grpstep = b.getGrpstep();
   int num = dao.maxnum(); //num �ִ밪 ����
   String msg = "�亯��Ͻ� ���� �߻�";
   String url = "replyForm.jsp?num="+b.getNum();
   b.setNum(++num);
   b.setGrplevel(grplevel +1);
   b.setGrpstep(grpstep +1);
   if(dao.insert(b)) {
	   msg = "�亯��� �Ϸ�";
	   url = "list.jsp";
   }
%>
<script>
   alert("<%=msg%>");
   location.href="<%=url%>";   
</script>
