<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/scriptex1.jsp
   스크립트(Script) 예제 : 자바 영역
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Script 예제</title>
</head>
<body>
<%   //스크립트릿(scriptlet)
   String msg = "스크립트 예제";
   for(int i=1; i<=10; i++) {
%>
   <%= i + ":" + msg /* 표현식은 한줄 주석 사용불가. 여러줄 주석만 사용 가능 */%><br> 
<%} //for 구문 끝%>
<%! //선언문
   String msg = "선언문으로 선언한 msg 변수";
   String getMsg() {
	   return msg;
   }
%>
</body>
</html>