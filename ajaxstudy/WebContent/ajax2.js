// /WebContent/ajax2.js
// 자바스크립트에서 객체를 생성.
// 콜백함수에서 ajax 객체를 매개변수로 전달 방법
var ajax = {} //객체
ajax.xhr = {} //객체
//ajax.xhr.Request 객체의 생성자 구현
//멤버변수 : url,params,callback,method,req
//멤버메서드 : send
ajax.xhr.Request = function(url,params,callback,method) { //생성자
	this.url = url;
	this.params = params;
	this.callback = callback;
	this.method = method;
	this.send(); //호출
}
//prototype : 멤버구현
ajax.xhr.Request.prototype = {
		getXmlHttpRequest : function() {
			if(window.ActiveXObject) {
				try {
					return new ActiveXObject("Msxml2.XMLHTTP");
				} catch(e) {
					try {
						return new ActiveXObject("Microsoft.XMLHTTP");
					} catch(e2) { return null; }
				}
			} else if (window.XMLHttpRequest) {
				return new XMLHttpRequest();
			} else {
				return null;
			}
		},
		send : function () {
			//this.req : ajax 객체 저장
			this.req = this.getXmlHttpRequest();
			var httpMethod = this.method?this.method:"GET";
			if(httpMethod != "GET" && httpMethod != "POST") {
				httpMethod = "GET";
			}
			var httpParams = (this.params == null || this.params == '')?null:this.params;
			var httpUrl = this.url;
			if(httpMethod == 'GET' && httpParams != null) {
				httpUrl = httpUrl + "?" + httpParams;
			}
			//ajax 준비
			this.req.open(httpMethod,httpUrl,true);
			//전송을 위한  Header 정보 설정
			this.req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			//this : ajax.xhr.Request 객체
			var request = this;
			//콜백함수 등록, 상태가 변경될때마다 onStateChange 함수 호출
			this.req.onreadystatechange = function() {
			    request.onStateChange.call(request);
			}
			this.req.send(httpMethod == "POST"?httpParams:null);
		},
		onStateChange : function() {
			this.callback(this.req); //콜백함수 호출시 ajax 객체 전달
		}
}