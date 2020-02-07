<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/write.jsp 
   1. 파라미터 값을 model.Board 객체 저장.
      useBean 사용 불가 : request 정보의 파라미터와 빈클래스의 프로퍼티 비교
                       request 객체를 사용 할 수 없음.
   2. 게시물번호 num 현재 등록된 num의 최대값을 조회. 최대값+1 등록된 게시물의 번호.
      db에서 maxnum을 구해서 +1 값으로 num 설정하기
   3. board 내용을 db에 등록하기
          등록성공 : 메세지 출력. list.jsp 페이지이동
          등록실패 : 메세지 출력. writeForm.jsp 페이지 이동
--%>
<%
//1. 파라미터 값을 model.Board 객체 저장
   String uploadpath = application.getRealPath("/") + "model1/board/file/";
   File f = new File(uploadpath);
   if(!f.exists()) f.mkdirs(); //uploadpath 해당폴더가 없으면 f.mkdirs()->한개만 만들어 
   int size = 10*1024*1024;
   MultipartRequest multi = new MultipartRequest
		   (request,uploadpath,size,"euc-kr");
   Board board = new Board();
   board.setName(multi.getParameter("name")); //board 객체에 원하는 정보들 담기
   board.setPass(multi.getParameter("pass"));
   board.setSubject(multi.getParameter("subject"));
   board.setContent(multi.getParameter("content"));
   board.setFile1(multi.getFilesystemName("file1"));
   BoardDao dao = new BoardDao();
   int num = dao.maxnum(); //db에 등록된 게시물 번호 최대값
   String msg = "게시물 등록이 실패";
   String url = "writeForm.jsp";
   board.setNum(++num); //num의 최대값 +1 게시물 번호 증가시켜줌
   board.setGrp(num); //게시물 그룹번호(답변글 작성시 같은 번호로 작성됨)
   if(dao.insert(board)) {
	   msg = "게시물 등록 성공";
	   url = "list.jsp";
   }
%>
<script>
   alert("<%=msg%>");
   location.href="<%=url%>";
</script>