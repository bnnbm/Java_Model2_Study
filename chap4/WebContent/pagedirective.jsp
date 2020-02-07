<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<!-- /WebContent/pagedirective.jsp
   page 지시어 예제
     속성으로 현재 페이지의 특징을 설정하는 기능
   language="java" : 기본 언어 java. 기본값 java 생략 가능
   contentType     : 반드시 기술해야함.
                     text/html; => html 형식으로 작성 전달
                     charset=EUC-KR => 한글은 EUC-KR로 설정.
                     pageEncoding="EUC-KR" 기능이 동일.
   import : 클래스의 패키지명을 생략 하는 기능. 여러번 처리 가능
 -->
<html>
<head>
<meta charset="EUC-KR">
<title>page 지시어</title>
</head>
<body>
<%
   Date today = new Date();
   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
현재 일시 : <%= df.format(today) %>
</body>
</html>