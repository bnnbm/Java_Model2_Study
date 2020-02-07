<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/decorator/decorator2.jsp --%>
<%@ taglib prefix="decorator" 
           uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<title><decorator:title /></title>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif;}
.w3-sidebar {
  z-index: 3;
  width: 250px;
  top: 30px;
  bottom: 0;
  height: inherit;
}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
   $(function(){ //문서로드가 완료된 경우
	   exchangeRate();
//	   setInterval(exchangeRate,1000*60)
   })
   function exchangeRate() {
	   $.ajax("${path}/model2/ajax/exchange2.do",{
<%-- data : exchange.jsp 에서 제공된 html 페이지 --%>
		   success : function(data){ //콜백함수
			   $("#exchange").html(data);
		   },
		   error : function(e){
			   alert("서버 오류:" + e.status);
		   }
	   })
   }
   var randomColorFactor = function(){
	      return Math.round(Math.random() *255);
	}
	var randomColor = function(opacity){
	   return "rgba(" + randomColorFactor() + ","
	            +randomColorFactor() + ","
	            +randomColorFactor() + ","
	            +(opacity || '.3')+ ")";
	}
	  $(document).ready(function(){ //문서 로드가 완료된 경우
//	     exchangeRate(); //환율정보 크롤링으로 로드
	    //setInterval(exchangeRate,1000*60)
	      graph(); //그래프를 위한 데이터를 ajax로 가져오기
	 })
	 function graph() {
	    $.ajax("${path}/model2/ajax/graph2.do",{
	       success : function(data){
	          pieGraphprint(data);
	          barGraphprint(data);
	       },
	       error : function(e){
	          alert("서버 오류:" + e.status);
	       }
	    })
	 }
	 function pieGraphprint(data){
	    //data : 서버에서 전달한 JSON 형태 데이터
	    // [{"name":"홍길동","cnt":10},{"name":"김삿갓","cnt":9}]
	    var rows = JSON.parse(data);
	     var names = [];
	     var datas = [];
	     var colors = [];
	     $.each(rows,function(index,item) {
	        names[index] = item.name;
	        datas[index] = item.cnt;
	        colors[index] = randomColor(1);
	     })
	     var config = {
	        type : 'pie',
	        data : {
	           datasets : [{
	              data : datas,
	              backgroundColor : colors,
	           }],
	           labels : names
	        },
	        options:{
	           responsive : true,
	           legend : {position:'top',},
	           title : {
	              display : true,
	              text : '글쓴이 별 게시판 등록 건수'
	           }
	        }
	     };
	     var ctx = document.getElementById("canvas2").getContext("2d")
	     new Chart(ctx,config);
	 }
	 function barGraphprint(data) {
		 var rows = JSON.parse(data);
		 var names = []; //라벨데이터
		 var datas = []; //건수데이터
		 var colors = []; //색상
		 //json 파일을 분석하여 필요한 데이터로 저장
		 $.each(rows,function(index,item) {
			 names[index] = item.name;
			 datas[index] = item.cnt;
			 colors[index] = randomColor(1);
		 })
		 var chartData = {
			 labels : names,
			 datasets : [{
				 type : 'line',
				 borderWidth : 2,
				 borderColor : colors,
				 label : '건수',
				 fill : false,
				 data : datas,
			 }, {
				 type : 'bar',
				 label : '건수',
				 backgroundColor : colors,
				 data : datas,
				 borderWidth : 2
			 }]
		 }
		 var ctx = document.getElementById('canvas1').getContext('2d');
		 new Chart(ctx, {
			 type : 'bar',
			 data : chartData,
			 options : {
				 responsive : true,
				 title : {display : true,
					      text : '글쓴이 별 게시판 등록 건수'
					      },
				 legend : {display : false},
				 scales : {
					 xAxes : [{
						 display : true,
						 scaleLabel : {
							 display : true,
							 labelString : "게시물 작성자"
						 },
						 stacked : true
					 }],
					 yAxes : [{
						 display : true,
						 scaleLabel : {
							 display : true,
							 labelString : "게시물 작성 건수"
						 },
						 stacked : true
					 }]
				 }
			 }
		 });
	 }
	</script>
</script>
<decorator:head />
<link rel="stylesheet" href="${path}/css/main.css">
<script type="text/javascript" 
   src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js">
</script>
<body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-theme w3-top w3-right-align w3-large">
       <c:if test="${!empty sessionScope.login}">
       ${sessionScope.login}님이 로그인 하셨습니다.
       <a href="${path}/model2/member/logout.me">[로그아웃]</a>
       </c:if>
       <c:if test="${empty sessionScope.login}">
       <a href="${path}/model2/member/loginForm.me">[로그인]</a>
       <a href="${path}/model2/member/joinForm.me">[회원가입]</a>       
       </c:if>
  </div>
</div>

      


<!-- Sidebar -->
<nav class="w3-sidebar w3-bar-block w3-collapse w3-large w3-theme-l5 w3-animate-left" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large" title="Close Menu">
    <i class="fa fa-remove"></i>
  </a>
  <h4 class="w3-bar-item"><b>Menu</b></h4>
  <a class="w3-bar-item w3-button w3-hover-black" href="${path}/model2/member/main.me">회원관리</a>
  <a class="w3-bar-item w3-button w3-hover-black" href="${path}/model2/board/list.do">게시판</a>
  <div class="w3-container">
  <div class="w3-clear"></div>
  <div id="exchange"></div>
  </div>
</nav>




<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
<div class="w3-main" style="margin-left:250px">
  <div class="w3-row w3-padding-64">
    <div class="w3-twothird w3-container">
    
        <div class="w3-half">
   <div class="w3-container w3-padding-16">
      <div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>
      <div id="container" style="width : 75%;">
      <canvas id="canvas1"></canvas>
      </div>
      </div>
   </div>

       <div class="w3-half">
   <div class="w3-container w3-padding-16">
      <div class="w3-left"><i class="fa fa-eye w3-xxxlarge"></i></div>
      <div id="barcontainer" style="width : 75%;">
      <canvas id="canvas2"></canvas>
      </div>
      </div>
   </div>
    
    
    <decorator:body/>
    </div>
    <div class="w3-third w3-container">
      <p class="w3-border w3-padding-large w3-padding-32 w3-center">AD</p>
      <p class="w3-border w3-padding-large w3-padding-64 w3-center">AD</p>
    </div>
  </div>
  
  <footer id="myFooter">
    <div class="w3-container w3-theme-l2 w3-padding-32">
      <h4>구디아카데미 Since 2016</h4>
    </div>

    <div class="w3-container w3-theme-l1">    
      <p>Powered by <a href="www.goodee.co.kr" target="_blank">조형도</a></p>
    </div>
  </footer>

<!-- END MAIN -->
</div>

<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
</script>

<script type="text/javascript" src="https://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
	<div style="width:75%;">
		<canvas id="canvas"></canvas>
	</div>
	<script>
		var MONTHS = ['1분기','2분기','3분기','4분기'];
		var ChartData = {
				labels: MONTHS,
				datasets: [{
					label: '남',
					fill : false,
					backgroundcolor: "#FF90FF",
					borderColor: "#FF90FF",
					borderWidth: 1,
					data : [10, 15, 25 ,55] },
					{
						label: '여',
						fill : false,
						backgroundcolor: "#FF90FF",
						borderColor: "#0000FF",
						borderWidth: 1,
					    data: [3,8,18,15] }]
			};
		window.onload = function() {
			var ctx1 = document.getElementById('barcanvas').getContext('2d');
			window.myBar = new Chart(ctx1, {
				type : 'bar',
				data : ChartData, //데이터
				options : {
					responsive : true}
			});
			var ctx2 = document.getElementById('linecanvas').getContext('2d');
			window.myBar = new Chart(ctx2, {
			    type : 'line',
			    data : ChartData, //데이터
			    options : {
				    responsive : true}
		});
	};
    </script>
</body>
</html>
