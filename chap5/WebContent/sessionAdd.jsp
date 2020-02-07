<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/sessionAdd.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>장바구니 추가</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr");
   String product = request.getParameter("product"); //사과, 자몽
   //getAttribute : cart 속성의 객체를 리턴, 등록된 속성의 값을 조회
   List<String> cart = (List<String>)session.getAttribute("cart");
   if(cart == null) { //cart 속성이 없을 경우
	   cart = new ArrayList<String>();
   //setAttribute : session 객체에 cart 속성을 등록
	   session.setAttribute("cart", cart);
   }
   cart.add(product);
%>
<script>
   alert("<%=product%>이(가) 장바구니에 추가되었습니다.")
   history.go(-1);
</script>
</body>
</html>