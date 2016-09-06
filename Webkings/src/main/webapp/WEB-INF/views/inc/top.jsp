<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clear.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/top_m.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/top_f.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/body.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member.css"/>	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
										<a href="#">
											<em>전체연령대</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>10대신상품</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>20대신상품</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>30대신상품</em>
										</a>
									</dd>
								</dl>
								<dl class="item-sel">
									<dt>전체상품</dt>
									<dd>
										<a href="#">
											<em>ALL</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>OUTER</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>TOP</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>BOTTOM</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>SHOES</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>BAG</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>ACC/ETC</em>
										</a>
									</dd>
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
									<dd>
										<a href="#">
											<em>트랜드</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em></em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em></em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em></em>
										</a>
									</dd>
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
					<script type="text/javascript">
						$(document).ready(function(){
							$("#bt1").click(function(event){
								if(!$("#tos1").is(":checked")){
									alert("이용약관에 동의하셔야 합니다.");
									$("#divtos").css("display","block");
									$("#tos1").focus();
									return false;
								}else if (!$("#tos2").is(":checked")) {
									alert("개인정보취급방침에 동의하셔야 합니다");
									$("#divtos").css("display","block");
									$("#tos2").focus();
									return false;
								}
					
								$("#divtos").css("display","none");
								$("#divreg").css("display","block");
					
							});
						});
					</script>	
					
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
					    <div class="container" style="background-color:#f1f1f1">
					      <button type="button" id="bt1" class="cancelbtn">다음</button>
					    </div>
					</div>
				</div>
				
				
				<!-- 이용약관 끝 -->
	<!-- 회원가입 시작-->	
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
	$("#form1").submit(function(event){
		if($("#mEmail").val().length<1){
			alert("이메일을 입력하세요.");
			$("#divreg").css("display","block");
			$("#mEmail").focus();
			return false;
		}else if($("#mNick").val().length<1){
			alert("닉네임을 입력하세요.");
			$("#divreg").css("display","block");
			$("#mNick").focus();
			return false;
		}else if($("#mPwd").val().length<1){
			alert("비밀번호를 입력하세요.");
			$("#divreg").css("display","block");
			$("#mPwd").focus();
			return false;
		}else if($("#mPwd_ok").val().length<1){
			alert("비밀번호확인을 입력하세요.");
			$("#divreg").css("display","block");
			$("#mPwd_ok").focus();
			return false;
		}else if($("#mPwd").val()!= $("#mPwd_ok").val()){
			alert("비밀번호가 다릅니다.");
			$("#divreg").css("display","block");
			$("#mPwd_ok").focus();
			return false;
		}
		
		$("#divreg").css("display","none");
		
	});
});
</script>


				<div id="divreg" class="modal">
				 <span onclick="document.getElementById('divreg').style.display='none'" class="close" title="Close Modal">&times;</span>
					<div class="amodel">
						<form id="form1" class="modal-content animate"
							action="<c:url value="/member/register.do"/>" method="post"
							enctype="multipart/form-data">

							<h2 class="h2">회원가입</h2>
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
							</div>


							<div class="container" style="background-color: #f1f1f1">
								<input type="submit" class="cancelbtn" value="회원가입" />
							</div>
						</form>
					</div>
				</div>
				<!-- 회원가입 끝-->
				<!-- 로그인 시작-->		
<script type="text/javascript">
$(document).ready(function(){
	$("#formLogin").submit(function(event){
		if($("#mEmail").val().length<1){
			alert("이메일을 입력하세요.");
			$("#divLogin").css("display","block");
			$("#mEmail").focus();
			return false;
		}else if($("#mPwd").val().length<1){
			alert("비밀번호를 입력하세요.");
			$("#divLogin").css("display","block");
			$("#mPwd").focus();
			return false;
		}
		
		$("#divLogin").css("display","none");
	});
	
});
</script>


					<div id="divLogin" class="modal">
						<span
							onclick="document.getElementById('divLogin').style.display='none'"
							class="close" title="Close Modal">&times;</span>
						<div class="amodel">
							<form class="modal-content animate" id="formLogin"
								action="<c:url value='/member/login.do'/>" method="post">
								<div class="imgcontainer">
									<img src="<c:url value='/images/logo.png'/>" alt="Avatar"
										class="avatar">
								</div>

								<div class="container">
									<hr>
									<div class="reg">
										<input type="text" placeholder="이메일" name="mEmail" id="mEmail"
											value="${cookie.ck_mEmail.value}">
									</div>
									<div class="reg">
										<input type="password" placeholder="비밀번호" name="mPwd"
											id="mPwd">
									</div>
									<input type="submit" class="cancelbtn" value="로그인" /> <label
										for="chkId">아이디 저장</label> <input type="checkbox"
										checked="checked" id="chkId" name="chkId"> <a href="#"
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
								<a href="<c:url value='/member/tos.do'/>" id="reg"> <img
									alt="회원가입" src="<c:url value='/images/email.png'/>"
									class="img1" /></a> </a>
							</div>

						</div>
					</div>

					<!-- 로그인 끝-->	
			</div>
		</div>
		<div class="bg"></div>
	</div>

