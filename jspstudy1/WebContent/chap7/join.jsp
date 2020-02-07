<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- /WebContent/chap7/join.jsp --%>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="join" class="chap7.Member" />
<jsp:setProperty property="*" name="join" /> <%-- 입력들어온 파라미터 값과 setProperty 값을 비교해서 데이터를 채워넣음 --%>
<%-- join 객체에 파라미터값이 전부 저장된 상태 --%>
<table border="1" style="border-collapse: collapse";>
<caption>회원가입</caption>
<tr><td>아이디</td>
    <td><jsp:getProperty name="join" property="id"/></td></tr>
<tr><td>비밀번호</td>
    <td><jsp:getProperty name="join" property="pass"/></td></tr>
<tr><td>이름</td>
    <td><jsp:getProperty name="join" property="name"/></td></tr>
<tr><td>성별</td>
   <%-- <td><%=join.getGender()==1?"남자":"여자" %></td></tr> --%>
   <td><jsp:getProperty name="join" property="gender2"/></td></tr>
<tr><td>나이</td>
    <td><jsp:getProperty name="join" property="age"/></td></tr>
<tr><td>이메일</td>
    <td><jsp:getProperty name="join" property="email"/></td></tr>
</table>
</body>
</html>