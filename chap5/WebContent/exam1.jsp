<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>입력된 숫자 까지의 합 구하기</title>
</head>
<body>
<%
   request.setCharacterEncoding("euc-kr");
   int num = Integer.parseInt(request.getParameter("num"));
   int sum = 0;
   for(int i=1; i<=num; i++) {
		sum += i;
	}
%>
<%=num %>까지의 합 : <%=sum %>
<br> 
</body>
</html>