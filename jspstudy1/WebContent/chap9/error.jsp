<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- 현재 페이지가 오류 처리 페이지임 : 예외 객체 전달 --%>    
<%@ page isErrorPage="true" %>   <%-- exception 객체 전달 --%>
<%-- /WebContent/chap9/error.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>오류 페이지</title>
</head>
<body>
<h1>파라미터 name을 입력해 주세요</h1>
<h1>계속 오류 발생시 전산부로 전화 요망</h1>
<h1>담당자 : 홍길동, 전화 : 1234</h1>
<%= exception.getClass().getName() %>
<% // exception.printStackTrace(response.getWriter()); %>
<!-- 오류페이지의 출력 용량이 500바이트 미만인 경우 브라우저에서 현재페이지가 아닌 http오류페이지를 출력할 수 있음.
      그러므로 500바이트 이상이 되도록 오류페이지의 메세지를 출력해야 함 -->
<!-- 오류페이지의 출력 용량이 500바이트 미만인 경우 브라우저에서 현재페이지가 아닌 http오류페이지를 출력할 수 있음.
      그러므로 500바이트 이상이 되도록 오류페이지의 메세지를 출력해야 함 -->
</body>
</html>