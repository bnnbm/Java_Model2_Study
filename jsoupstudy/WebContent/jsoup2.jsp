<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jsoup2.jsp : 1���� tr�±׵鸸 �����Ͽ� ��� --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSoup�� �̿��� ũ�Ѹ� ����</title>
<style type="text/css">
   table,td,th {border:2px solid grey;}
</style>
</head>
<body>
<% 
   String url = "https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001"; 
//   String url = "https://www.koreaexim.go.kr/site/homepage/menu/viewMenu?menuid=001001004001001";
   String line = "";
   Document doc = null;
   try {
	   doc = Jsoup.connect(url).get();
	   //e1 : url�� �����ϴ� html ������ �±װ� table�� �±׵� ����
	   Elements e1 = doc.select("table");
	   for(Element ele : e1) {
		   Elements e2 = ele.select("tr");
		   for(Element ele2 : e2) {
			   String temp = ele2.html();
			   System.out.println("==========");
			   System.out.println(temp);
			   line += "<tr>" + temp + "</tr>";
		   }
	   }
   } catch(IOException e) {
	   e.printStackTrace();
   }
%><table><%=line%></table>
</body>
</html>