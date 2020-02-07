<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>간단한 계산기</title>
</head>
<body>
<%
   int num1 = Integer.parseInt(request.getParameter("num1"));
   int num2 = Integer.parseInt(request.getParameter("num2"));
 //  int kbn = Integer.parseInt(request.getParameter("kbn"));
   String kbn = request.getParameter("kbn");
   String sum = null;
/*
   switch (kbn) {
   case 0 : sum = num1 + num2; break;
   case 1 : sum = num1 - num2; break;
   case 2 : sum = num1 * num2; break;
   case 3 : sum = num1 / num2; 
   }
*/
   switch(kbn) {
   case "+" : sum = String.format("%d",num1 + num2); break;
   case "-" : sum = String.format("%d",num1 - num2); break;
   case "*" : sum = String.format("%d",num1 * num2); break;
   case "/" : sum = String.format("%/.2f",(double)num1/num2); 
   }
%>
<%=num1+kbn+num2+"="+sum%>

<%--<%=num1%><%=(kbn==0)?"+":(kbn==1)?"-":(kbn==2)?"*":"/" %><%=num2%>=<%=sum %> --%>
</body>
</html>