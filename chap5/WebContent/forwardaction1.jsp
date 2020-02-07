<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/forwardaction1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jsp Action 태그 예제</title>
</head>
<body>
<h3>이 페이지는 forwardaction2.jsp로 forward 됩니다.
       이 내용은 화면에 출력되지 않습니다. forward 될때 request 객체도 forwardaction2.jsp 페이지로 전달됩니다.
       즉, forwardaction1.jsp 와 forwardaction2.jsp 페이지는 같은 request 영역의 페이지입니다.</h3>
<jsp:forward page="forwardaction2.jsp">
   <jsp:param value="****" name="test"/>
   <jsp:param value="forward test" name="add"/>
</jsp:forward>
</body>
</html>