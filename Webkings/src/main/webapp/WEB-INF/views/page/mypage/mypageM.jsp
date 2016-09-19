<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypage.css"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript" src="<c:url value='/js/mainM.js'/>"></script>
<script type="text/javascript">
$(document).ready(function() {
	var pageNum = ${pageNum};
	$(".gnb li:nth-child("+pageNum+")").addClass("active");
	
	$(".gnb li").mouseenter(function() {
		$(".gnb li").removeClass("active");
		$(this).addClass("active");
	})
	$(".gnb li").mouseleave(function() {
		$(this).removeClass("active");
		$(".gnb li:nth-of-type("+pageNum+")").addClass("active");
	});
	
	// 회원 탈퇴
	$("#memberQuit").click(function () {
		$("#divEdit").css("display","none");
		$("#divQuit1").css("display","block");
	});
	
	$("#favorprod").click(function () {
		if($("#semail").val().length<1){
			$("#divLogin").css("display","block");
			return false;
		}
	});
	
	$("#coupon").click(function() {
		alert("서비스 준비중입니다");
	});
});
</script>
	

<%@ include file="../../inc/top.jsp" %>
<div class="body-sec">
<div class="in-sec">
		<div class="footer">
			<div class="list-top-2">
				<div class="in">
					<div class="tab-type-2">
						<ul>
							<li class="active single"><a href="javascript:;" class="nlink">마이페이지</a></li>
						</ul>
					</div>
				</div>
			</div>
	<div class="in-sec-2">
		<ul class="mypage-btn">
		
		<c:if test="${empty sessionScope.mEmail }">
			<li class="login"><a onclick="document.getElementById('divLogin').style.display='block'">로그인</a></li>
		</c:if >
		<c:if test="${!empty sessionScope.mEmail }">
			<li class="login"><a onclick="document.getElementById('divEdit').style.display='block'">내정보 관리</a></li>
		</c:if>
			<li class="recent-prod"><a href="<c:url value='/prodList.do'/>">최근 본 상품<em></em></a></li>
			<li class="recent-shop"><a href="<c:url value='/shop/latelyShopList.do'/>">최근 본 샵<em></em></a></li>
			<li class="coupon"><a href="javascript:;"  id="coupon">쿠폰북</a></li>
			<li class="favor" id="favorprod"><a href="<c:url value='/myitemList.do'/>">관심상품</a></li>
			<li class="follow"><a href="#login">내팔로잉<em></em></a></li>
		</ul>
	</div>
	<%@ include file="footer-sec.jsp" %>

</div>
<!--  회원정보 수정 -->
	<div id="divEdit" class="modal">
			
			<div class="amodel">
				<span
				onclick="document.getElementById('divEdit').style.display='none'"
				class="close1" title="Close Modal">&times;</span>
				<form id="formEdit" name="formEdit" target="_iFrmForAction"
					method="post" action="<c:url value='/member/memberEdit.do'/>"
					enctype="multipart/form-data">
					<div class="imgfile1">

						<div class="imgfile">
							<img id="UploadedImg1" src="<c:url value='/images/person-icon.png'/>" />
						</div>
						<div>
							<input type='file' name="upFile1" id="upFile1"
								onchange="readURL1(this)" /> <input type="hidden"
								name="oldmImage" value="${membervo.mImage }">
						</div>
					</div>
					<div id="divedit">
					<div class="reg"><input type="text" name="mNick"
							placeholder="닉네임" id="mNick">
					</div>
							 <a id="memberQuit"><p>회원탈퇴</p></a>
					</div>
					<button type="submit" class="cancelbtn" style="width: 100%;">수정완료</button>
				</form>
			</div>
	</div>
	<!-- 회원 정보 수정 끝-->
	<!-- 회원 탈퇴 -->
		<div id="divQuit1" class="modal">
			
		<div class="amodel">
		<span
				onclick="document.getElementById('divQuit1').style.display='none'"
				class="close1" title="Close Modal">&times;</span>
		<form  action="<c:url value="/member/memberQuit.do"/>" method="post" id="formQuit">
			<div class="divp">
			<h2 class="h2">다음 안내사항을 확인해주세요</h2>
			<p>
				탈퇴 후 회원정보 및 개인형 서비스 정보는<br>
				 모두 삭제 됩니다.<br>
				가입시 입력한 정보 : 이메일, 닉네임, 생년월일, 성별<br> 
				서비스 이용 정보 : Point, 친구쇼핑몰목록, 관심상품<br>
				삭제된 정보는 복구 불가능합니다</p>
			</div>
			<div class="reg">
				<input type="checkbox" id="inquit" name="inquit">
				<label for="inquit">내용을 확인하였으며, 이에 동의합니다.</label>
			</div>
			<button type="submit" class="cancelbtn" id="cancelbtn" style="width: 100%;">회원탈퇴</button>
		</form>
		</div>
	</div>
	<!-- 회원 탈퇴 끝 -->	
</div>

</body>
</html>