<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/loginForm.jsp 
   .. : ��������, css�� jspstudy1�ȿ� �ְ� ���� loginForm�� model1 �Ʒ��� �����Ƿ� ..�� �ٿ��� ���������� �ѹ� ����� css���� ����
   "../../css/main.css" : ����� ���
   "/jspstudy1/css/main.css" : ������ ���
   <link rel="stylesheet" href="../../css/main.css">
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ȭ��</title>
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
   <caption>�α���</caption>
   <tr><th>���̵�</th><td><input type="text" name="id" value=""></td></tr>
   <tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
   <tr><td colspan="2">
       <input type="submit" value="�α���">
       <input type="button" value="ȸ������" onclick="location.href='joinForm.jsp'">
       <input type="button" value="���̵�ã��" onclick="javascript:win_upload()">
       <input type="button" value="��й�ȣã��" onclick="javascript:win_upload2()">
   </td></tr>
</table>
</form>
</body>
</html>