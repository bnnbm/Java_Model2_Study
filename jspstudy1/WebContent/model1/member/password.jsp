<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/password.jsp 
   1.로그아웃 상태인 경우. 로그인하세요 메세지출력
   2. 로그인상태임
          다른 사용자의 비밀번호 변경불가.
      opener 페이지를 loginForm.jsp 페이지 이동.
           현재페이지 닫기
   3. pass,chgpass 파라미터 값 가져오기
   4. pass 비밀번호가 db에 저장된 비밀번호와 틀리면 비밀번호 오류메세지 출력. passwordForm.jsp 페이지 이동
   5. pass 비밀번호가 db에 저장된 비밀번호와 같으면 비밀번호 수정, opener 페이지를 updateForm.jsp 페이지 이동, 현재페이지 닫기
--%>    
<%
    String login =(String)session.getAttribute("login");
    boolean opener = false;
    boolean closer = false;
    String msg = null;
    String url = null;    
    if(login == null || login.trim().equals("")) {//로그아웃상태
    	opener = true;
        closer = true;
        msg = "로그인하세요.";
        url = "loginForm.jsp";
    } else { //로그인상태
    	String pass = request.getParameter("pass");
        String chgpass = request.getParameter("chgpass");
        MemberDao dao = new MemberDao();
    	Member mem = dao.selectOne(login);
    	if(pass.equals(mem.getPass())) { //입력된 비밀번호가 db와 같은경우
    		closer = true;
    		if(dao.password(login,chgpass) > 0) {
    			msg="비밀번호가 변경 되었습니다.";
    		} else {
    			msg="비밀번호 변경시 오류가 발생 했습니다.";
    		}
    	} else { //입력된 비밀번호와 db에 저장된 비밀번호가 다른 경우
    		msg="비밀번호 오류입니다. 확인하세요.";
    	    url="passwordForm.jsp";
    	}
    }

%>
<script>
    alert("<%=msg%>");
    <% if(opener) {%>
       opener.location.href="<%=url%>";
       <%} else {%>
       location.href="<%=url%>";
    <%}%>
    <% if(closer) { %>
    self.close();
    <%}%>    
</script>
