<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/images/tab logo.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clear.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/body.css"/>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript">
	var loginURL="<c:url value='/login.do'/>";
$(document).ready(function(){	
	if($("#semail").val().length<1){
		$(".modal2").css("display","block");		
	}else {
		$("#aLogout").append("로그아웃");	
		$(".modal2").css("display","none");
	}
	
	$(".mypage-btn li a").click(function() {
		if($("#semail").val().length<1){
			$(".modal2").css("display","block");
			return false;
		}
	});
});
</script>
<script type="text/javascript" src="<c:url value='/js/admin.js'/>"></script>
<title>관리자 페이지</title>
</head>
<body>
<input type="hidden" name="semail" id="semail" value="${sessionScope.mEmail}">
<div class="header">
	<div class="shadow">
		<div>
			<div class="in-sec">
	<h1><a href="<c:url value='/admin.do'/>"></a></h1>
	<div class="title">관리자 페이지</div>
	<div class="logout"><a id=aLogout href="<c:url value='/logout.do'/>"></a></div>
	<div id="divLogin" class="modal2">
						<div class="amodel2">
							<form class="modal-content animate" id="formLogin" name="formLogin" method="post">
								<div class="imgcontainer">
									<img src="<c:url value='/images/logo.png'/>" alt="Avatar"
										class="avatar">
								</div>
								<div class="container">
									<div class="reg">
										<input type="text" placeholder="관리자 아이디" name="mEmail" id="mEmail1">
									</div>
									<div class="reg">
										<input type="password" placeholder="관리자 비밀번호" name="mPwd"
											id="mPwd1">
									</div>
										<button type="submit" class="cancelbtn">로그인</button>
								</div>
							</form>
						</div>
					</div>
	<!-- 성별 선택 -->
		<div id="genderSel" class="modal">
			<span onclick="document.getElementById('genderSel').style.display='none'" class="close" title="Close Modal">&times;</span>
				<div class="amodel">
					<div class="adF">
						<span>여성</span>
					</div>
					<div class="adM">
						<span>남성</span>
					</div>
				</div>
		</div>	
</div></div></div><div class="bg"></div></div>
