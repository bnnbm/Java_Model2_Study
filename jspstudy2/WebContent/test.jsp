<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>test</title>
</head>
<body>
<form method="post" name="f">
   x:<input type="text" name="x" value="${param.x}" size="5">
   <select name="op">
      <option>+</option><option>-</option>
      <option>*</option><option>/</option>
   </select>
   y:<input type="text" name="y" value="${param.y}" size="5">
     <input type="submit" value="="><br>
</form>
<c:choose>
  <c:when test="${param.op=='+'}">
    <h2>${param.x} + ${param.y} = ${param.x+param.y}</h2>
  </c:when>
  <c:when test="${param.op=='-'}">
    <h2>${param.x} - ${param.y} = ${param.x-param.y}</h2>
  </c:when>
  <c:when test="${param.op=='*'}">
    <h2>${param.x} * ${param.y} = ${param.x*param.y}</h2>
  </c:when>
  <c:when test="${param.op=='/'}">
    <h2>${param.x} / ${param.y} = ${param.x/param.y}</h2>
  </c:when>
</c:choose>
</body>
</html>