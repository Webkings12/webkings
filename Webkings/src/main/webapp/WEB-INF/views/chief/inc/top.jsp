<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<link rel="icon" href="${pageContext.request.contextPath}/images/tab logo.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/chief/skin.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/chief/base.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마케팅센터</title>
</head>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript">
var cEmail;
var cPwd;
</script>
<script type="text/javascript" src='<c:url value="/js/chiefLeft.js"/>'></script>
<script type="text/javascript">
//로그인
var loginCheck="";
$(document).ready(function() {
$("#formLogin").submit(function(event){
	
	if($("#cEmail1").val().length<1){
		alert("사업자 이메일을 입력하세요.");
		$("#divLogin").css("display","block");
		$("#cEmail1").focus();
		return false;
	}else if($("#cPwd1").val().length<1){
		alert("비밀번호를 입력하세요.");
		$("#divLogin").css("display","block");
		$("#cPwd1").focus();
		return false;
	}else{
		cEmail=$("#cEmail1").val();
		cPwd=$("#cPwd1").val();
		alert(cEmail);
		alert(cPwd);
		$.ajax({
			url:"<c:url value='/chief/chiefLogin.do'/>",
			type:"POST",
			async:false,
			data:"cEmail="+cEmail+"&cPwd="+cPwd, //요청 파라미터
			dataType:"json",
			success:function(res){
				if(res==1){
					alert(res);
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
});
function logout(){
  location.href="/Webkings/chief/logout.do";
}
</script>
<body>
	<!-- header -->
	<div class="headSec">
		<h1>
			<a href="<c:url value='/chief/chiefMain.do'/>">
				<img src="${pageContext.request.contextPath}/images/chief/mkcenter.jpg" alt="마케팅센터">
			</a>
		</h1>
		<div class="fleft">
			<div class="icon">
				<a href="javascript:;" class="icon">가이드 페이지</a>
				
				<div class="list">
					<ul class="boxRD5">
						<li>
							<a>제휴문의</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="divLogin" class="modal">
						<span onclick="document.getElementById('divLogin').style.display='none'"
							class="close" title="Close Modal">&times;</span>
						<div class="amodel2">
							<form class="modal-content animate" id="formLogin" name="formLogin">
								<div class="imgcontainer">
									<img src="<c:url value='/images/logo.png'/>" alt="Avatar"
										class="avatar">
								</div>

								<div class="container">
									<div class="reg">
										<input type="text" placeholder="사업자 아이디" name="C_EMAIL" id="cEmail1"
											value="${cookie.ck_cEmail.value}">
									</div>
									<div class="reg">
										<input type="password" placeholder="비밀번호" name="C_PWD"
											id="cPwd1">
									</div>
									<button type="submit" class="cancelbtn" >로그인</button>
									<div class="searchBox">
									<input type="checkbox" id="chkId1" name="chkId1"
										<c:if test="${!empty cookie.ck_cEmail.value}">
											checked
										</c:if>
									> 
									<label for="chkId">아이디 저장</label> 
									<a href="javascript:;" id="find"	class="a">비밀번호 찾기</a>
									</div>
								</div>
							</form>
						</div>
					</div>
	<!-- header 경계선 -->	
	<div class="hspace1"></div>
