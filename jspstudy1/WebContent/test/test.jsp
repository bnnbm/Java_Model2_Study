<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/test.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 가입 정보 확인</title>
<link rel="stylesheet" href="../css/chd.css">
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="join" class="chd.Member" />
<jsp:setProperty property="*" name="join" />
<table>
<td colspan="3"><caption>회원가입</caption>
<tr><td rowspan="5"><img src="\jspstudy1\test\sm_Tulips.jpg" "width=100,","height=100"></td></tr>
<tr><td>아이디</td>
    <td><jsp:getProperty name="join" property="id"/></td></tr>
<tr><td>비밀번호</td>
    <td><jsp:getProperty name="join" property="pass"/></td></tr>
<tr><td>이름</td>
    <td><jsp:getProperty name="join" property="name"/></td></tr>
<tr><td colspan="2">성별</td>
   <td><jsp:getProperty name="join" property="gender2"/></td></tr>
<tr><td colspan="3">전화번호</td>
    <td><jsp:getProperty name="join" property="tel"/></td></tr>
<tr><td colspan="3">이메일</td>
    <td><jsp:getProperty name="join" property="email"/></td></tr>
<tr><td colspan="4">Goodee Acadamy Since 2016 - written by 조형도</td></tr>
</table>
</body>
</html>