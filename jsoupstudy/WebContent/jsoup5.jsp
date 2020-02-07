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
   String url = "http://www.hanwhaeagles.co.kr/html/players/player/pitcher_view.asp?sGubunCd=PLPPPC&sMSId=P379"; 
   String line = "";
   String title = "";
   try {
	   Document doc = Jsoup.connect(url).get();
	   Elements body = doc.select("html");
	   for(Element src : body) {
		   out.println(src.toString());
	   }
   } catch(IOException e) {
	   e.printStackTrace();
   }
%>
<table>
</table>
</body>
</html>