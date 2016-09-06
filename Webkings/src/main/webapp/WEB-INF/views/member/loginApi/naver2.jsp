<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="322313348244-d0nvh2l8k8lv01jrlsue4lhdr2juvnfg.apps.googleusercontent.com">
</head>
<body>
 
<a id="google_join_btn" href="javascript:void(0);">구글로 로그인</a>
<a href="javascript:void(0);" onclick="FB.login(FaceBookApp.statusChangeCallback, FaceBookApp.FBScopes);">페이스북으로 로그인</a>
 
<script type="text/javascript" src="https://apis.google.com/js/api:client.js"></script>
<script type="text/javascript" src="/asset/js/sns_login_google.js"></script>
<script type="text/javascript">
var GoogleApp = {
	     auth2: {},
	     // 초기화
	     init: function() {
	          gapi.load('auth2', function() {
	               GoogleApp.auth2 = gapi.auth2.init({
	                    client_id: '322313348244-d0nvh2l8k8lv01jrlsue4lhdr2juvnfg.apps.googleusercontent.com',
	                    cookiepolicy: 'single_host_origin',
	               });
	 
	               // 특정 노드에 구글 로그인 버튼 연동
	               GoogleApp.attachSignin(document.getElementById('google_join_btn'));
	          });
	     },
	     // 특정 노드에 구글 로그인 연동
	     attachSignin: function(element) {
	          // 버튼 노드, ?, 로그인 성공시 콜백함수, 로그인 실패시 콜백함수
	          GoogleApp.auth2.attachClickHandler(element, {}, GoogleApp.signinCallback, GoogleApp.signinFailure);
	     },
	     // 로그인 성공시 콜백함수
	     signinCallback: function(googleUser) {
	          var id = googleUser.getBasicProfile().getId();
	          var memberName = googleUser.getBasicProfile().getName();
	          var email = googleUser.getBasicProfile().getEmail();
	          var token = googleUser.getAuthResponse().access_token;
	          location.href="/Webkings/main.do";
	          // 실행할 코드
	     },
	     // 로그인 실패시 콜백함수
	     signinFailure: function(error) {
	          console.log(JSON.stringify(error, undefined, 2));
	     }
	};
	// 초기화 실행
	GoogleApp.init();
</script>

</body>
</html>
