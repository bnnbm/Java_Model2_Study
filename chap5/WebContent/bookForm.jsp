<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/bookForm.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록 작성하기</title>
</head>
<body>
<form action="book.jsp" method="post">
방문자 <input type="text" name="name"><br><br>
제목 &nbsp;&nbsp;&nbsp;<input type="text" name="title"><br><br>
내용 &nbsp;&nbsp;&nbsp;<textarea name="text" style="width:300px; height:300px;"></textarea><br>
<input type="submit" value="글쓰기" style="position:absolute; left:180px; bottom:330px">
</body>
</html>