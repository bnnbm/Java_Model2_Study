// ajaxstudy/WebContent/ajax.js
var ajax = null;
//ajax 객체 생성 기능
//표준객체의 이름 : XMLhttpRequest 객체임.
function getAjaxObject() {
   if(window.ActiveXObject) { //브라우저가 익스플러러?
      try {
         return new ActiveXObject("Msxml2.XMLHTTP");
      } catch(e) {
         try {
            return new ActiveXObject("Microsoft.XMLHTTP");
         } catch(e2) {
            return null;
         }
      }
   } else if (window.XMLHttpRequest) { //익스플러러 이외의 브라우저?
      return new XMLHttpRequest();
   } else {
      return null;
   }
}//getAjaxObject() 함수 끝
//url: "hello.jsp"
//params : "name="+김삿갓
//callback : helloFromServer
//method : "POST"
function sendRequest(url,params,callback,method) {
	//ajax : XMLHttpRequest 객체를 저장. ajax 실행하는 객체, 서버와 통신할 수 있는 객체
   ajax = getAjaxObject();
   //httpMethod : GET || POST 둘중 한개의 값
   var httpMethod = method?method:"GET";
   if(httpMethod != "GET" && httpMethod != "POST") {
      httpMethod = "GET";
   }
   //GET 방식인 경우
   //httpParams : hello.jsp?name=김삿갓
   //POST 방식인 경우
   //httUrl=hello.jsp
   var httpParams = (params == null || params == '')?null:params;
   var httpUrl = url;
   if(httpMethod == "GET" && httpParams != null) {
      httpUrl = httpUrl + "?" + httpParams;
   }
   //준비 하기
   //true : 비동기 방식.
   ajax.open(httpMethod,httpUrl,true);
   ajax.setRequestHeader
         ("Content-Type","application/x-www-form-urlencoded");
   //콜백함수 등록
   //콜백함수는 ajax 객체의 상태가 변경될때 마다 호출되는 함수
   ajax.onreadystatechange = callback;
   //서버에 요청
   ajax.send(httpMethod=="POST"?httpParams:null);
}