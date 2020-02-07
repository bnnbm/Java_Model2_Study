<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/list.jsp
    1. ���������� 10���� �Խù��� ����ϱ�.
       pageNum �Ķ���Ͱ��� ����. => ���� ���� 1�� �����ϱ�.
    2. �ֱ� ��ϵ� �Խù��� ���� ���� ��ġ��.
    3. ȭ�鿡 ���.
      �Խù��� ��ºκ�
      ������ ���� ��� �κ�.   
     --%>
<% 
   int pageNum = 1;
   try{
      pageNum = Integer.parseInt(request.getParameter("pageNum"));
   }catch (NumberFormatException e){}
   int limit = 10; //�� �������� ����� �Խù� �Ǽ�
   BoardDao dao = new BoardDao();
   int boardcount = dao.boardCount(); //��ϵ� ��ü �Խù��� �Ǽ�
   //ȭ�鿡 ��µ� �Խù� ������
   List<Board> list = dao.list(pageNum,limit);
   //mapage : �������� ����
   /*
            ��ü �Խù� �Ǽ� : 21��=>3������
            21.0/10 + 0.95 =>(int)(3.05) => 3
            ��ü �Խù� �Ǽ� : 20��=>2������
            21.0/10 + 0.95 =>(int)(2.95) => 2
            ��ü �Խù� �Ǽ� : 101��=>11������
            101.0/10 + 0.95 =>(int)(11.05) => 11
            
   */
   int maxpage = (int)((double)boardcount/limit + 0.95);
   //startpage : ȭ�鿡 ǥ�õ� ù��° ������
   /*
        pageNum: 2 => 1
               (2/10.0 + 0.9) => ((int)(1.1)-1)*10 + 1 => 1
        pageNum: 10 => 1
               (10/10.0 + 0.9) => ((int)(1.9)-1)*10 + 1 => 1   
        pageNum: 11 => 11
               (11/10.0 + 0.9) => ((int)(2.0)-1)*10 + 1 => 11   
   */
   int startpage = ((int)(pageNum/10.0 +0.9) - 1) * 10 + 1;
   //endpage : ȭ�鿡 ǥ�õ� ������ ������
   int endpage = startpage + 9; //���������� ��ȣ
   if(endpage > maxpage) endpage = maxpage;
   int boardnum = boardcount -(pageNum - 1) * limit;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<titler>�Խù� ��� ����</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>�Խ��Ǹ��</caption>
   <% if(boardcount == 0){ //��ϵ� �Խù� ����%>
   <tr>
       <td colspan="5">��ϵ� �Խñ��� �����ϴ�.</td>
   </tr>   
   <% }else { //��ϵ� �Խù� ���� %>
   <tr>
       <td colspan="5" style="text-align:right">�۰���:<%= boardcount %></td>
   </tr>
   <tr>
       <th width="8%">��ȣ</th><th width="50%">����</th> 
       <th width="14%">�ۼ���</th><th width="17%">�����</th>
       <th width="11%">��ȸ��</th>
   </tr>
<% for(Board b : list) {%>
   <tr><td><%=boardnum--%></td><td style="text-align: left">
   <%-- ÷������ ǥ���ϱ� --%>
       <%if(b.getFile1() != null && !b.getFile1().trim().equals("")) {%>
       <a href ="file/<%=b.getFile1()%>" style="text-decoration:none;">@</a>
       <%} else {%>&nbsp;&nbsp;&nbsp;<%} %>
       
       <%if(b.getGrplevel() > 0) {
    	   for(int i=1; i<b.getGrplevel(); i++) { %>
    	   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <%} %>��<%} //��� ĭ���� %>
                     
       <a href ="info.jsp?num=<%=b.getNum() %>"><%= b.getSubject() %></a></td>
       <td><%=b.getName() %></td><td><%=b.getRegdate() %></td>
       <td><%=b.getReadcnt() %></td>
   </tr>
   <%} //for ���� ���� %>
   
   
   <tr>
       <td colspan="5">
       <% if (pageNum <= 1) { %>[����]<%} else { %>
       <a href="list.jsp?pageNum=<%=pageNum - 1 %>">[����]</a><% } %>
       <% for (int a=startpage; a<=endpage; a++) {%>
           <% if (a == pageNum) {%> [<%=a %>] <%} else { %>
           <a href="list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
           <%} 
          } %>
       <% if (pageNum >= maxpage) {%> [����] <% } else { %>
       <a href="list.jsp?pageNum=<%=pageNum + 1 %>">[����]</a><% } %></td>
   </tr>
<%} //else ���� ����(��ϵȰԽù� �����Ҷ��� else) %>
   <tr>
       <td colspan="5" style="text-align:right">
       <a href="writeForm.jsp">[�۾���]</a></td>
   </tr>
</table>
</body>
</html>