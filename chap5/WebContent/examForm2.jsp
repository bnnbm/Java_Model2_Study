<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/examForm2.jsp
   ȭ�鿡�� ���ڸ� �Է¹޾� ���ڱ��� ��,¦��,Ȧ���� ���ϱ� --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Էµ� ���ڱ����� �� ���ϱ�</title>
<script type="text/javascript">
   function inputcheck(f,kbn) {
	   if(isNaN(f.num.value)) {
		   alert("���ڸ� �Է��ϼ���");
		   f.num.focus();
		   f.num.value = "";
		   return false;
	   }
	   f.kbn.value = kbn;
	   f.submit(); //submit �߻�
   }
</script>
</head>
<body>
<form action="exam2.jsp" method="post">
<input type="hidden" name="kbn" value="0">
<input type="text" name="num">������ �� ���ϱ�
<input type="button" value="�հ�" onclick="inputcheck(this.form,0)">
<input type="button" value="¦���հ�" onclick="inputcheck(this.form,1)">
<input type="button" value="Ȧ���հ�" onclick="inputcheck(this.form,2)">
</form>
</body>
</html>