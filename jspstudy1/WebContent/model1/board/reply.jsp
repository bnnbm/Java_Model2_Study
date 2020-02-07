<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- /WebContent/model1/board/reply.jsp : 답글 등록
   1. 파라미터 값을 Board 객체에 저장하기 =>useBean 태그 사용
      원글정보 : num, grp, grplevel, grpstep
      답글정보 : name, pass, subject, content
   2. 같은 grp 값을 사용하는 게시물들의 grpstep 값을 1 증가 하기.
      void BoardDao.grpStepAdd(num,grpstep)
   3. Board 객체를 db에 insert 하기.
      num : maxnum + 1
      grp : 원글과 동일.
      grplevel : 원글 + 1
      grpstep : 원글 + 1
   4. 등록 성공시 : "답변등록 완료 메세지 출력후, list.jsp 페이지 이동
           등록 실패시 : "답변등록시 오류발생" 메시지 출력 후, replyForm.jsp 페이지 이동하기
--%>
<%
   request.setCharacterEncoding("euc-kr");%>
   <jsp:useBean id="b" class="model.Board" />
   <jsp:setProperty name="b" property="*" />
<%
   BoardDao dao = new BoardDao();
   //2. 같은 grp값을 사용하는 게시물들의 grpstep 값을 1증가 시키기
   dao.grpStepAdd(b.getGrp(), b.getGrpstep());
   //3. Board 객체를 db에 insert 하기.
   int grplevel = b.getGrplevel();
   int grpstep = b.getGrpstep();
   int num = dao.maxnum(); //num 최대값 저장
   String msg = "답변등록시 오류 발생";
   String url = "replyForm.jsp?num="+b.getNum();
   b.setNum(++num);
   b.setGrplevel(grplevel +1);
   b.setGrpstep(grpstep +1);
   if(dao.insert(b)) {
	   msg = "답변등록 완료";
	   url = "list.jsp";
   }
%>
<script>
   alert("<%=msg%>");
   location.href="<%=url%>";   
</script>
