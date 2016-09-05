<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member.css"/>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<html lang="ko">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="/asset/js/sns_login_facebook.js"></script>
<body>

 <!-- 페이스북 1767015933560224;-->

<script type="text/javascript">
$(document).ready(function(){
	$("#form").submit(function(event){
		if($("#mEmail").val().length<1){
			alert("이메일을 입력하세요.");
			$("#id01").css("display","block");
			$("#mEmail").focus();
			return false;
		}else if($("#mPwd").val().length<1){
			alert("비밀번호를 입력하세요.");
			$("#id01").css("display","block");
			$("#mPwd").focus();
			return false;
		}
		
		$("#id01").css("display","none");
	});
	
});
</script>
<body>

<div id="id01" class="modal">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
  <div class="amodel">
  <form class="modal-content animate" id="form"
   action="<c:url value='/member/login.do'/>" method="post">
    <div class="imgcontainer">
      <img src="<c:url value='/images/logo.png'/>" alt="Avatar" class="avatar">
    </div>

    <div class="container">
    <div class="reg">
      <input type="text" placeholder="이메일" name="mEmail" id=mEmail>
	</div>
	<div class="reg">
      <input type="password" placeholder="비밀번호" name="mPwd" id=mPwd>
    </div>   
      <input type="submit"  class="cancelbtn" value="로그인"/>
      <label for="chkId">아이디 저장</label>
      <input type="checkbox" checked="checked" id="chkId" name="chkId">
    </div>

  </form>
  	<hr>
  	<h4 id="h4">빠른로그인</h4>
  	 <div class="regdiv">
  	 	
		<a id="custom-login-btn" href="javascript:loginWithKakao()">
		<img alt="카카오" src="<c:url value='../images/kakaolink.png'/>" class="img1"/></a>

	</div>

		<div class="regdiv">
			<a id="google_join_btn" href="javascript:void(0);">
			<img  alt="구글" src="<c:url value='../images/Google.png'/>" class="img1" /></a>
		</div>
	<div id="naver_id_login" class="regdiv">
		
	</div>
	<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
		</fb:login-button>

	<div class="regdiv">
		 <a class="regdiv" href="<c:url value='/member/tos.do'/>" id="reg">
		 	<img  alt="회원가입" src="<c:url value='../images/email.png'/>" class="img1" /></a>
		 </a>
	</div>
	
	</div>
</div>


<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naver_id_login = new naver_id_login("hnHk72nmxpcjD70Gfi0M", "http://192.168.0.39:9090/Webkings/main.do");
	//등록한 ClientID 값  등록한 Callback URL 값
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
	naver_id_login.get_naver_userprofile("naverSignInCallback()");v
</script>

<!-- 카카오 -->
<script type='text/javascript'>
  
    //<![CDATA[
      // 사용할 앱의 JavaScript 키를 설정해 주세요.
      Kakao.init('9ccbc592cdad5e00996fdc1c739bad84');
      function loginWithKakao() {
          // 로그인 창을 띄웁니다.
          Kakao.Auth.login({
            success: function(authObj) {
              alert("로그인성공");
              location.href="/Webkings/main.do";
            },
            fail: function(err) {
              alert(JSON.stringify(err));
            }
          });
        };

  </script>


</body>
</html>
