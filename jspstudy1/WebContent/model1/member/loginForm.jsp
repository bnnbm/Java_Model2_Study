<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/loginForm.jsp 
   .. : 상위폴더, css는 jspstudy1안에 있고 현재 loginForm은 model1 아래에 있으므로 ..을 붙여서 상위폴더로 한번 가줘야 css적용 가능
   "../../css/main.css" : 상대경로 방식
   "/jspstudy1/css/main.css" : 절대경로 방식
   <link rel="stylesheet" href="../../css/main.css">
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 화면</title>
<link rel="stylesheet" href="/jspstudy1/css/main.css">
<script type="text/javascript">
   function win_upload() {
	   var op = "width=500, height=150, left=50, top=150";
	   open("idForm.jsp","",op);
   }
   function win_upload2() {
	   var op = "width=500, height=150, left=50, top=150";
	   open("pwForm.jsp","",op);
   }
   function win_open() {
	   var op = "width=500, height=150, left=50, top=150";
	   open(page+".jsp","",op);
   }
</script>
</head>
<body>
<form action="login.jsp" method="post" name="f">
<table>
   <caption>로그인</caption>
   <tr><th>아이디</th><td><input type="text" name="id" value=""></td></tr>
   <tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
   <tr><td colspan="2">
       <input type="submit" value="로그인">
       <input type="button" value="회원가입" onclick="location.href='joinForm.jsp'">
       <input type="button" value="아이디찾기" onclick="javascript:win_upload()">
       <input type="button" value="비밀번호찾기" onclick="javascript:win_upload2()">
   </td></tr>
</table>
</form>
</body>
</html>