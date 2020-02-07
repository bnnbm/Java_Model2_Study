<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/pictureForm.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사진등록 선택</title>
<link rel="stylesheet" href="../css/chd.css">
</head>
<body>
업로드
<form action="picture.jsp" method="post" enctype="multipart/form-data">
<input type="file" name="picture">
<input type="submit" value="전송">
</body>
</html>