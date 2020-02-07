<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fmt �±� ����</title>
</head>
<body>
<fmt:requestEncoding value="euc-kr"/>
<form method="post" name="f">
	�̸�: <input type="text" name="name" value="${parse.name}"><br>
	�Ի���: <input type="text" name="hiredate" value="${parse.hiredate}">
	(yyyy-MM-dd ���·� �Է�)<br>
	�޿�: <input type="text" name="salary" value="${parse.salary}"><br>
	<script type="text/javascript">
		document.f.salary.value = 
			'<fmt:formatNumber value="${param.salary}" pattern="#,###,###" />';
	</script>
	<input type="submit" value="����">
</form>
<hr>
�̸�: ${param.name}<br>
�Ի���: ${param.hiredate}<br>
�޿�: ${param.salary}<br>
<h3>����: �Ի����� yyyy�� MM�� dd�� E���� ���·� ���<br>
	�޿��� ���ڸ����� ,�� ���.<br>
	�޿�*12�� ������ ����ϰ�, ���ڸ����� ,�� ����ϱ�</h3>
�̸�:${param.name}<br>
<fmt:parseDate var="date" value="${param.hiredate}" pattern="yyyy-MM-dd"/>
�Ի���: <fmt:formatDate value="${date}" pattern="yyyy�� MM�� dd�� E���� "/><br>
�޿�: <fmt:formatNumber value="${param.salary}" pattern="#,###,###"/> <br>
����: <fmt:formatNumber value="${param.salary * 12}" pattern="#,###,###"/><br>
</body>
</html>