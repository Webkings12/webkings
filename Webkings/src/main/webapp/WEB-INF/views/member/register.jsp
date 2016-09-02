<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member.css"/>
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Custom Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript" src="https://apis.google.com/js/api:client.js"></script>
<script type="text/javascript" src="/asset/js/sns_login_google.js"></script>

<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('f506150ae980717ff260eb20383eba9d');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
          alert(JSON.stringify(authObj));
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };
  //]]>
  
  // 페이스북
 
  // This is called with the results from from FB.getLoginStatus().
  var FaceBookApp = {
     FBScopes: {scope: 'public_profile,email'},
     accessToken: '',
     // 초기화 함수
     init: function(d, s, id) {
          window.fbAsyncInit = function() {
               FB.init({
                    appId : '1767015933560224',
                    xfbml : true,
                    version : 'v2.6'
               });
          };
 
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) {return;}
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/en_US/sdk.js";
          fjs.parentNode.insertBefore(js, fjs);
     },
     statusChangeCallback: function(response) {
          FaceBookApp.accessToken = response.authResponse.accessToken;
 
          // 연결 성공
          if (response.status === 'connected') {
               // 연결 성공시 실행할 코드
               FaceBookApp.FBsigninCallback();
          // 인증 거부
          } else if (response.status === 'not_authorized') {
               console.log('Please log into this app.');
          // 그 밖..
          } else {
               console.log('Please log into Facebook.');
          }
     },
     FBsigninCallback: function() {
          FB.api('/me?fields=id,email,name', function(response) {
               var id = response.id;
               var token = FaceBookApp.accessToken;
               var memberName = response.name;
               var email = response.email;
 
               // 실행할 코드
 
          });
     }
};
// 초기화 실행
FaceBookApp.init(document, 'script', 'facebook-jssdk');

  // 구글
  var GoogleApp = {
	        auth2: {},
	        // 초기화
	        init: function() {
	             gapi.load('auth2', function() {
	                  GoogleApp.auth2 = gapi.auth2.init({
	                       client_id: '1028799917585-e4lntu0ag702frveh3faoemdo6omfsco.apps.googleusercontent.com',
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
<script type="text/javascript">
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#UploadedImg').attr('src', e.target.result);
            $('#UploadedImg').css({"width":"80px"},{"height":"80px"});
            $('#UploadedImg').css("border-radius","40px");
        }
        reader.readAsDataURL(input.files[0]);
    }
}

$(document).ready(function(){
	$("#form").submit(function(event){
		if($("#mEmail").val().length<1){
			alert("이메일을 입력하세요.");
			$("#id01").css("display","block");
			$("#mEmail").focus();
			return false;
		}else if($("#mNick").val().length<1){
			alert("닉네임을 입력하세요.");
			$("#id01").css("display","block");
			$("#mNick").focus();
			return false;
		}else if($("#mPwd").val().length<1){
			alert("비밀번호를 입력하세요.");
			$("#id01").css("display","block");
			$("#mPwd").focus();
			return false;
		}else if($("#mPwd_ok").val().length<1){
			alert("비밀번호확인을 입력하세요.");
			$("#id01").css("display","block");
			$("#mPwd_ok").focus();
			return false;
		}else if($("#mPwd").val()!= $("#mPwd_ok").val()){
			alert("비밀번호가 다릅니다.");
			$("#id01").css("display","block");
			$("#mPwd_ok").focus();
			return false;
		}
		
		$("#id01").css("display","none");
		
	});
});
</script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member.css" />

<div id="id01" class="modal">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
	<div class="amodel">
  <form id="form" class="modal-content animate"
  action="<c:url value="/member/register.do"/>" method="post" enctype="multipart/form-data" >
    <div class="reg">
    <div class="imgfile">
       <img id="UploadedImg" 
       src="" /> 
    </div>
    <div>
		<input type='file' name="upFile" onchange="readURL(this)"/>
    </div>
    </div>
   
    <div class="container1">
    	<div class="reg">
      		<input type="text" placeholder="이메일" name="mEmail" id="mEmail">
    	</div>
    	<div class="reg"> 
      		<input type="text" placeholder="닉네임" name="mNick" id="mNick">
   		</div>
		<div class="reg">
      		<input type="password" placeholder="비밀번호" name="mPwd" id="mPwd">
      	</div>
    	<div class="reg">  
      		<input type="password" placeholder="비밀번호확인" name="mPwd_ok" id="mPwd_ok">
    	</div>
    </div>
	

    <div class="container" style="background-color:#f1f1f1">
    <%-- <div class="regdiv">
    	<fb:login-button scope="public_profile,email" onlogin="checkLoginState();"/>
    	<img  alt="카카오" src="<c:url value='../images/kakaolink.png'/>" class="img1" />
	</div> --%>
	 <div class="regdiv">
		<a id="custom-login-btn" href="javascript:loginWithKakao()">
		<img  alt="카카오" src="<c:url value='../images/kakaolink.png'/>" class="img1" />
		</a>
	</div>
		<div class="regdiv">
			<a id="google_join_btn" href="javascript:void(0);">
			<img  alt="구글" src="<c:url value='../images/Google.png'/>" class="img1" /></a>
		</div>
	<div id="naver_id_login" class="regdiv">
		
	</div>
		
	<!-- 네이버 -->	
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("3M_DJpojkr2fyowsWYaT", "http://192.168.0.46:9090/Webkings/member/register.do");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 1,50);
		naver_id_login.setDomain(".service.com");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
		function naverSignInCallback() {
			// naver_id_login.getProfileData('프로필항목명');
			// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
			alert(naver_id_login.getProfileData('email'));
			alert(naver_id_login.getProfileData('nickname'));
			alert(naver_id_login.getProfileData('age'));
		}
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
	</script>
      <input  type="submit" class="cancelbtn" value="회원가입" />
    </div>
  </form>
</div>
</div>

