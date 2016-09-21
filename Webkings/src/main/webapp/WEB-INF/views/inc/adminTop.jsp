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
var gender="${gender}";

</script>
<script type="text/javascript">
$(document).ready(function(){	
	var adminId=$("#semail").val();
	if(adminId!=null && adminId!=""){
		$("#aLogout").append("로그아웃");	
		$(".modal2").css("display","none");
	}else{
		$(".modal2").css("display","block");
	}
	$(".mypage-btn li a").click(function() {
		if(adminId!=null && adminId!=""){
		}else{
			$(".modal2").css("display","block");
		}
	});

	for(var i=0;i<$("#length").val();i++){
		$("#memEdit"+i).click(function() {
			$("#admindivEdit").css("display","block");
			var email=$(this).next().val();
			var nick=$(this).next().next().val();
			var image=$(this).next().next().next().val();
			var mNo=$(this).next().next().next().next().val();
			$("#mEmail").val(email);
			$("#mNick").val(nick);
			$("#oldmImage").val(image);
			$("#mNo").val(mNo);
			
			if(image==""){
				 $("#UploadedImg1").attr("src", "<c:url value='/user_images/person-icon.png'/>");
			}else {
				 $("#UploadedImg1").attr("src", "<c:url value='/user_images/"+image+"'/>");
			}
		});
	}
});

//이미지 원으로
function readURL1(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#UploadedImg1').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
<script type="text/javascript" src="<c:url value='/js/admin.js'/>"></script>
<title>관리자 페이지</title>
</head>
<body>
<input type="hidden" name="semail" id="semail" value="${sessionScope.adminmEmail}">
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
	<!--아이템 성별 선택 -->
		<div id="ItemGenderSel" class="modal">
			<span onclick="document.getElementById('ItemGenderSel').style.display='none'" class="close" title="Close Modal">&times;</span>
				<div class="amodel">
					<div class="adF">
						<span><input type="hidden" value="F">여성</span>
					</div>
					<div class="adM">
						<span><input type="hidden" value="M">남성</span>
					</div>
				</div>
		</div>	
		<div id="ShopGenderSel" class="modal">
			<span onclick="document.getElementById('ShopGenderSel').style.display='none'" class="close" title="Close Modal">&times;</span>
				<div class="amodel">
					<div class="adF">
						<span><input type="hidden" value="F">여성</span>
					</div>
					<div class="adM">
						<span><input type="hidden" value="M">남성</span>
					</div>
				</div>
		</div>
		
		
				<!--  회원정보 수정 -->
	<div id="admindivEdit" class="modal">
			
			<div class="amodelEdit">
				<span
				onclick="document.getElementById('admindivEdit').style.display='none'"
				class="close" title="Close Modal">&times;</span>
				<form id="formEdit" name="formEdit" target="_iFrmForAction"
					method="post" action="<c:url value='/admin/adminEdit.do'/>"
					enctype="multipart/form-data">
					<div class="imgcontainer">
						<img src="<c:url value='/images/logo.png'/>" alt="Avatar"
								class="avatar">
					</div>
					
					<div class="imgfile1">

						<div class="imgfile" style="margin-top: 50px; text-align: center;">
								<img id="UploadedImg1" src="" style="width: 80px;height: 80px; border-radius: 40px"/>
						</div>
						<div style="text-align: center;">
							<input type='file' name="upFile1" id="upFile1"
								onchange="readURL1(this)" />
								<input type="hidden" name="oldmImage" id="oldmImage">
								<input type="hidden" name="mNo" id="mNo">
						</div>
					</div>
					<div id="divedit" style="text-align: center;">
					<div class="reg">
						<label for="mEmail">이메일:</label>
						<input type="text" class="text"  name="mEmail" id="mEmail">
					</div>
					<div class="reg">
						<label for="mNick">닉네임:</label>
						<input type="text" class="text" name="mNick" id="mNick" >
					</div>
						
					</div>
					<button type="submit" class="cancelbtn" style="width: 100%;">수정완료</button>
				</form>
			</div>
	</div>
	<!-- 회원 정보 수정 끝-->
</div></div></div><div class="bg"></div></div>
