<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/examForm2.jsp
   화면에서 숫자를 입력받아 숫자까지 합,짝수,홀수합 구하기 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>입력된 숫자까지의 합 구하기</title>
<script type="text/javascript">
   function inputcheck(f,kbn) {
	   if(isNaN(f.num.value)) {
		   alert("숫자만 입력하세요");
		   f.num.focus();
		   f.num.value = "";
		   return false;
	   }
	   f.kbn.value = kbn;
	   f.submit(); //submit 발생
   }
</script>
</head>
<body>
<form action="exam2.jsp" method="post">
<input type="hidden" name="kbn" value="0">
<input type="text" name="num">까지의 합 구하기
<input type="button" value="합계" onclick="inputcheck(this.form,0)">
<input type="button" value="짝수합계" onclick="inputcheck(this.form,1)">
<input type="button" value="홀수합계" onclick="inputcheck(this.form,2)">
</form>
</body>
</html>