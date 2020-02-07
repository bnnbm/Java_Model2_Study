<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- /WebContent/jstl/jstlfmtEx3.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fmt 태그 : 인코딩</title>
</head>
<body>
<fmt:requestEncoding value="euc-kr"/>
<form method="post" name="f">
   이름:<input type="text" name="name" value="${param.name}"><br>
   입사일:<input type="text" name="hiredate" value="${param.hiredate}"> yyyy-MM-dd 형태로 입력<br>
   급여:<input type="text" name="salary" value="${param.salary}"><br>
   <input type="submit" value="전송">
</form>
<hr>
이름 : ${param.name}<br>
입사일 : ${param.hiredate}<br>
급여 : ${param.salary}<br>
<h3>입사일은 yyyy년 MM월 dd일 E요일 형태로 출력
   급여 세자리마다 ,를 출력하기
   연봉 급여*12 계산 세자리마다 ,를 출력
</h3>


<c:catch var="formatexception">
<fmt:parseDate value="${param.hiredate}" pattern="yyyy-MM-dd" var="day"/>
</c:catch>
<%-- 예외 발생이 안됨 --%>
<c:if test="${formatexception == null}">
이름 : ${param.name}<br>
입사일 : <fmt:formatDate value="${day}" pattern="yyyy년 MM월 dd일 E요일"/><br>
급여 : <fmt:formatNumber value="${param.salary}" var="num" pattern="##,###"/>${num}<br>
연봉 : <fmt:formatNumber value="${param.salary*12}" var="num2" pattern="##,###"/>${num2}<br>
</c:if>
<%-- 예외 발생이 됨 --%>
<c:if test="${formatexception != null}">
   <font color="red">입사일은 yyyy-MM-dd 형태로 입력하세요</font>
</c:if>
</body>
</html>