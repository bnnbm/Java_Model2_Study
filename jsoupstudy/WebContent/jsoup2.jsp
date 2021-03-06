<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jsoup2.jsp : 1에서 tr태그들만 선택하여 출력 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSoup을 이용한 크롤링 예제</title>
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
	   //e1 : url이 제공하는 html 문서중 태그가 table인 태그들 저장
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