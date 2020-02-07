<%@page import="java.nio.file.Path"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/picture.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
</script>
<link rel="stylesheet" href="../css/chd.css">
</head>
<body>
<% 
   String path = application.getRealPath("/")+"test/";
   int size = 10*1024*1024;
   MultipartRequest multi = new MultipartRequest
		   (request,path,size,"EUC-KR");
   String fname = multi.getFilesystemName("picture");
   
   BufferedImage bi = ImageIO.read(new File(path + fname));
   int width = bi.getWidth()/5;
   int height = bi.getHeight()/5; 
   BufferedImage thumb = new BufferedImage
		   (width,height,BufferedImage.TYPE_INT_RGB);
   Graphics2D g = thumb.createGraphics();
   g.drawImage(bi, 0, 0, width, height, null);
   File f = new File(path + "sm_" + fname);
   ImageIO.write(thumb,"jpg",f);
%>
<h3>이미지</h3>
<img src="sm_<%=fname %>">

<script type="text/javascript">
window.open("about:blank","_self").close();
</script>
</body>
</html>