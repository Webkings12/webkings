<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<link rel="icon" href="${pageContext.request.contextPath}/images/tab logo.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clear.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/top_m.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/top_f.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/body.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/item.css"/>	

<script type="text/javascript" src="<c:url value='/js/login.js'/>"></script>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<html lang="ko">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<meta charset="utf-8">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="322313348244-d0nvh2l8k8lv01jrlsue4lhdr2juvnfg.apps.googleusercontent.com">
<script type="text/javascript" src="https://apis.google.com/js/api:client.js"></script>
<script type="text/javascript" src="/asset/js/sns_login_google.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘뭐입지?</title>
<script type="text/javascript">
var gender = "${gender}";
var itNCount="${itNCount}";
var itOCount="${itOCount}";
</script>
</head>
<body class="F">
	<div class="header">
		<div class="shadow">
			<div>
				<div class="in-sec">
					<input type="hidden" id="gnb-sel" value="">
					<h1><a href="<c:url value='/page.do'/>">WEBKINGS</a></h1>
					<a href="#" class="gender f">여성</a>
					<a href="#" class="gender m">남성</a>
					<ul class="gnb">
						<li class="">
							<input type="hidden" id="gnbPage" value="/item">
							<a href="#">ITEM</a>
							<div class="depth2 sec2">
								<dl class="age-sel">
									<dt>추천신상품</dt>
									<dd>
										<a href="/Webkings/page.do?page=/item&gender=${gender}">
											<em>전체연령대</em>
										</a>
									</dd>
									<dd>
										<a href="/Webkings/page.do?page=/item&gender=${gender}&ageSel=10">
											<em>10대 신상품</em>
										</a>
									</dd>
									<dd>
										<a href="/Webkings/page.do?page=/item&gender=${gender}&ageSel=20">
											<em>20대 신상품</em>
										</a>
									</dd>
									<dd>
										<a href="/Webkings/page.do?page=/item&gender=${gender}&ageSel=30">
											<em>30대 신상품</em>
										</a>
									</dd>
								</dl>
								<dl class="item-sel">
									<dt>전체상품</dt>
									<dd>
										<a href="/Webkings/item/itemCate.do?page=/product&gender=${gender}&cate=ALL">
											<em>ALL</em>
										</a>
									</dd>
									<c:forEach var="Item_TypeVO" items="${itemList}">
										<dd><a href="/Webkings/item/itemCate.do?page=/product&gender=${gender}&cate=${Item_TypeVO.itName}"><em>${Item_TypeVO.itName}</em></a></dd>
									</c:forEach>
								</dl>
								<div class="bg"></div>
							</div>
						</li>
						<li class="">
							<input type="hidden" id="gnbPage" value="/shop">
							<a href="#">SHOP</a>
							<div class="depth2">
								<dl class="shop-sel">
									<dt>스타일전체</dt>
									<dd>
										<a href="#">
											<em>쇼핑몰전체</em>
										</a>
									</dd>
									 <c:forEach var="StyleVO" items="${styleList}">
										<dd>
											<a href="#">
												<em>${StyleVO.stName}</em>
											</a>
										</dd>
									</c:forEach> 
								</dl>
								<div class="bg"></div>
							</div>
						</li>
						<li class="">
							<input type="hidden" id="gnbPage" value="/info">
							<a href="#">INFO</a>
						</li>
						<li class="">
							<input type="hidden" id="gnbPage" value="/mypage">
							<a href="#">
								MY
								<!-- ::after -->
							</a>
						</li>
					</ul>
					<%-- <c:if test=""> 세션이 있으면 --%>
						<ul class="logout">
						<c:if test="${empty sessionScope.mEmail }">
							<li><a onclick="document.getElementById('divLogin').style.display='block'">로그인</a></li>
							<li><a
							onclick="document.getElementById('divtos').style.display='block'">회원가입</a></li>
						</c:if>					
						<c:if test="${!empty sessionScope.mEmail }">
							<li><a>${sessionScope.mNick}님</a></li>
							<li><a href="<c:url value='/member/logout.do'/>">로그아웃</a></li>
						</c:if>
						</ul>
					<%-- </c:if> --%>
					<%-- <c:if test="">  세션이 없으면 
						<div class="logout">
							<p><img alt="회원사진이미지" src="#">
								::after
							</p>
						</div>
					</c:if> --%>
					<div class="search">
						<form id="fmSearch" name="fmSearch" action="#" class="autoValidateForm"><p>
							<input type="text" name="q" value="" fieldname="검색어" checkfunctionname="checkSpecialChar"
							 restrictutf8bytes="45" class="__required" confirmmessage="특수문자로 검색하실수 없습니다." 
							 autocomplete="off" focus="off"/></p>
						</form>
						<!-- <div class="keyword"></div> 검색어 저장기능 사용시-->
					</div>
				</div>
				<!-- 이용약관 시작 -->
						
					
					<div id="divtos" class="modal">
					      <span onclick="document.getElementById('divtos').style.display='none'" class="close" title="Close Modal">&times;</span>
					  <div class="amodel">
					<div class="modal1">
					    <div class="imgcontainer">
					      <h2 class="h2">약관동의</h2>
					      <hr>
					    </div>
					  
					    <div class="tos">
					    	<label for="tos1">이용약관</label>
					    	<input type="checkbox" id="tos1" name="tos1" class="toss">
					    	<div>
					    		<iframe class="iframe" src="
					    		<c:url value='/common/provision.html'/>"></iframe>
					    	</div>
					    </div>
					    <div class="tos">
					    	<label for="tos2">개인정보취급방침</label>
					    	<input type="checkbox" id="tos2" name="tos2" class="toss">
					   		<div>
					    		<iframe class="iframe" src="
					    		<c:url value='/common/personal.html'/>"></iframe>
					    	</div>
					    </div>
					</div>
					    <div class="container" >
					      <button type="button" id="bt1" class="cancelbtn">다음</button>
					    </div>
					</div>
				</div>
				
				
				<!-- 이용약관 끝 -->
	<!-- 회원가입 시작-->	
<script type="text/javascript">
	$(document).ready(function(){
		$("#aCertify").click(function() {
			if(($("#mEmail").val().length<1)){
				alert("이메일을 입력하세요.");
				$("#divreg").css("display","block");
				$("#mEmail").focus();
				return false
			}
		$.ajax({
			url:"<c:url value='/certify/certifyNo.do'/>",
			type:"GET",
			data:"mEmail="+$("#mEmail").val(), //요청 파라미터
			dataType:"text",
			success:function(res){
				alert("인증메일이 발송되었습니다");
				$("#certifyChk").val(res);
			},
			error:function(xhr, status, error){
			}
		});
	});
		
});
</script>	

				<div id="divreg" class="modal">
				 <span onclick="document.getElementById('divreg').style.display='none'" class="close" title="Close Modal">&times;</span>
					<div class="amodel">
						<form id="form1" class="modal-content animate"
							action="<c:url value="/member/register.do"/>" method="post"
							enctype="multipart/form-data">
							<div class="imgcontainer">
								<h2 class="h2">회원가입</h2>
							</div>
							<hr>
							<div class="reg">
								<div class="imgfile">
									<img id="UploadedImg" src="" />
								</div>
								<div>
									<input type='file' name="upFile" onchange="readURL(this)" ;/>
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
									<input type="password" placeholder="비밀번호확인" name="mPwd_ok"
										id="mPwd_ok">
								</div>
								<div class="certify">
									<input type="text" placeholder="인증번호"
										 id="certify" name="certify" style="width: 40%; height: 30px;" >
									<a id="aCertify" style="width: 28%; height: 30px; font-size: 2.0ex">인증번호 받기</a>
								</div>
							</div>


							<div class="container">
								<button type="submit" class="cancelbtn" style="clear: both;">회원가입</button>
							</div >
						</form>
					</div>
				</div>
				<!-- 회원가입 끝-->
				<!-- 로그인 시작-->		
<script type="text/javascript">
$(document).ready(function(event){
	var loginCheck="";
	$("#formLogin").submit(function(event){
		if($("#mEmail1").val().length<1){
			alert("이메일을 입력하세요.");
			$("#divLogin").css("display","block");
			$("#mEmail1").focus();
			return false;
		}else if($("#mPwd1").val().length<1){
			alert("비밀번호를 입력하세요.");
			$("#divLogin").css("display","block");
			$("#mPwd1").focus();
			return false;
		}else{				
			$.ajax({
				url:"<c:url value='/member/login.do'/>",
				type:"POST",
				async:false,
				data:$(this).serialize(), //요청 파라미터
				dataType:"json",
				success:function(res){
					if(res==1){
					}else if (res==2) {
						alert("비밀번호가 다릅니다");
						$("#divLogin").css("display","block");
					}else if (res==3){
						alert("아이디가 존재하지 않습니다");
						$("#divLogin").css("display","block");
					}
					loginCheck=res;
				},
				error:function(xhr, status, error){
					alert(error);
				}
			});
		}
		if(loginCheck=="1"){
			return true; 
		}else{
			return false;
		}
	});
	
	
	$("#reg").click(function () {
		$("#divLogin").css("display","none");
		$("#divtos").css("display","block");
	});
			
	$("#find").click(function () {
		$("#divLogin").css("display","none");
		$("#divfind").css("display","block");
	});
});
</script>

					<div id="divLogin" class="modal">
						<span
							onclick="document.getElementById('divLogin').style.display='none'"
							class="close" title="Close Modal">&times;</span>
						<div class="amodel">
							<form class="modal-content animate" id="formLogin" method="post">
								<div class="imgcontainer">
									<img src="<c:url value='/images/logo.png'/>" alt="Avatar"
										class="avatar">
								</div>

								<div class="container">
									<hr>
									<div class="reg">
										<input type="text" placeholder="이메일" name="mEmail" id="mEmail1"
											value="${cookie.ck_mEmail.value}">
									</div>
									<div class="reg">
										<input type="password" placeholder="비밀번호" name="mPwd"
											id="mPwd1">
									</div>
									<button type="submit" class="cancelbtn" >로그인</button><label
										for="chkId">아이디 저장</label> <input type="checkbox"
										checked="checked" id="chkId" name="chkId"> <a href="#" id="find"
										class="a">비밀번호 찾기</a>
								</div>

							</form>
							<hr>
							<h4 id="h4">빠른로그인</h4>
							<div class="regdiv">

								<a id="custom-login-btn" href="javascript:loginWithKakao()">
									<img alt="카카오" src="<c:url value='/images/kakaolink.png'/>"
									class="img1" />
								</a>

							</div>

							<div class="regdiv">
								<a id="google_join_btn" href="javascript:void(0);"> <img
									alt="구글" src="<c:url value='/images/Google.png'/>"
									class="img1" /></a>
							</div>
							<div id="naver_id_login" class="regdiv"></div>

							<div class="regdiv">
								<a id="reg"> <img
									alt="회원가입" src="<c:url value='/images/email.png'/>"
									class="img1" /></a>
							</div>

						</div>
					</div>

					<!-- 로그인 끝-->	
					
				 	<!-- 비밀번호 찾기-->
				<div id="divfind" class="modal">
					<span
						onclick="document.getElementById('divfind').style.display='none'"
						class="close" title="Close Modal">&times;</span>
					<div class="amodel">

						<div class="modal2">
							<div class="imgcontainer">
								<h2 class="h2">비밀번호 찾기</h2>
								<br>
								<hr>
								<br><br><br><br>
							</div>

							<div class="tos">
								<p>가입하신 회원님의 이메일 주소를 입력해 주세요. 임시비밀번호를 메일로 발송해 드립니다.</p>
							</div>
						<form  method="post" action="<c:url value='/email/emailFind.do'/>" id="frmFind">
							<div class="tos">
								<input type="text" placeholder="이메일을 입력하세요" name="mEmail"
									id="mEmail2">
							</div>
							<div class="container" >
					      		<button type="submit" id="bt1" class="cancelbtn">확인</button>
							</div>
						</form>
						</div>	
					</div>	
					</div>

				<!--비밀번호 찾기 끝-->
 
				</div>
			</div>
		<div class="bg"></div>
	</div>


<!-- 구글 -->
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
	          
	          location.href="/Webkings/member/apiLogin.do?mEmail="+email+"&mNick="+memberName;
	          
	          
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
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
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
              Kakao.API.request({
            	  url: '/v1/user/me',
                  success: function(res) {
                    
					location.href="/Webkings/member/apiLogin.do?mEmail="+res.id+"&mNick="+res.properties.nickname;
                    
                  },
                  fail: function(error) {
                    alert(JSON.stringify(error));
                  }
                });
              
            },
            fail: function(err) {
              alert(JSON.stringify(err));
            }
          });
        };

  </script>
