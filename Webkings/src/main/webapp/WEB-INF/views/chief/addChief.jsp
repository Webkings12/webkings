<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/chief/skin.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/chief/base.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Marketing center</title>
</head>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript">
$(document).ready(function() {
	alert("arrive");
	$("#idcheck").click(function () {
		/*
			null chk
		*/		
		if($("#C_EMAIL").val().length < 1) {
			alert("사용하실 아이디를 입력해주세요.");
			$("#C_EMAIL").focus();
			return false;
		} else if(!chkEmail($("#C_EMAIL").val())) {
			alert("이메일 형식에 맞춰주세요.\r\n aaa@naver.com");
		}
		
		var C_EMAIL = $("#C_EMAIL").val();
		alert(C_EMAIL);
		
		/*
			사용중인 email인지 확인
		*/
		$.ajax({
			url:"<c:url value='/chief/insertChiefChkId.do'/>",
			type:"GET",
			data:"id="+C_EMAIL,
			dataType:"text",
			success:function(res){
				alert("success");
				alert(res);
				// "사용 가능합니다." or "이미 사용중인 아이디입니다."
				if(res.val().equals("사용 가능합니다.")) {
					$("#idChkResult").appendTo($(res));
					/*$("#idChkResult").css("style='color:red'", "#0000ff");*/
					$('#idChkResult').css('background-color','blue');
					/*document.getElementById('idChkResult').innerHTML = res;
					$("#idChkResult").html(res);*/
				} else {
					$("#idChkResult").appendTo($(res));
					$('#idChkResult').css('background-color','red');
					/*$("#idChkResult").css("color", "#ff0000");*/
				}				
			},
			error:function(xhr, status, error){
				alert(error);
			}
		});
		
		/*
			email 형식 확인
		*/
		function chkEmail(mEmail) {
			var reg_email =new RegExp(/^[a-zA-Z0-9]([-_\.]?[0-9a-zA-Z])*@[a-zA-Z]([-_\.]?[a-zA-Z])*\.[a-zA-Z]{2,3}$/i); 
			return reg_email.test(mEmail);
		}
	});
</script>
<script type="text/javascript">
$(document).ready(function() {
	$(function() {
		$(".input_click_init").focus(function() {
			$(this).val('');
		}).blur(function() {
			if( $(this).attr('id') == "C_PWD-re" || $(this).attr('id') == "C_PWD" ) {
				/*$(this).val(''); 비밀번호와 비밀번호 확인의 경우는 지우는 동작이 아닌 아무동작도 하지 않도록*/
			} else if ( $(this).val() == "" ) {
				$(this).val("값을 입력하세요.");
			}
			
			var C_PWD = $('#C_PWD').val();
			var C_PWD_re = $('#C_PWD-re').val();
			
			if( $(this).attr('id') == "C_PWD"  ) {
				return false;				
			} else if ( $(this).attr('id') == "C_PWD-re" ) {
				if( C_PWD ==  C_PWD_re ) {
					$('#C_PWD_RESULT').html("일치");
				} else {
					$('#C_PWD_RESULT').html("불일치");
				}
			}
		});
	});
});
</script>
<script type="text/javascript">
$(document).ready(function() {	
	$(".img_file_onchange").on('change', function() {
		alert(".img_file_onchange fnc");
		var imgloc = "";
		if( $(this).attr('id') == "logoFile1"  ) {
			imgloc = "preImgSec1";
		} else if ( $(this).attr('id') == "logoFile2"  ) {
			imgloc = "preImgSec2";
		} else if ( $(this).attr('id') == "adLogoFile1"  ) {
			imgloc = "preImgSec3";
		} else if ( $(this).attr('id') == "adLogoFile2"  ) {
			imgloc = "preImgSec4";
		};
		alert("imgloc = " + imgloc);
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자

        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        };
        
        if(imgloc == "preImgSec1") {
        	alert("arrive if 1");
        	file = $(this).prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('#preImgSec1 img').attr('src', blobURL);
            $('#preImgSec1').slideDown(); //업로드한 이미지 미리보기 
            $(this).slideUp(); //파일 양식 감춤
        } else if(imgloc == "preImgSec2") {
        	alert("arrive if 2");
        	file = $(this).prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('#preImgSec2 img').attr('src', blobURL);
            $('#preImgSec2').slideDown(); //업로드한 이미지 미리보기 
            $(this).slideUp(); //파일 양식 감춤
        } else if(imgloc == "preImgSec3") {
        	alert("arrive if 3");
        	file = $(this).prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('#preImgSec3 img').attr('src', blobURL);
            $('#preImgSec3').slideDown(); //업로드한 이미지 미리보기 
            $(this).slideUp(); //파일 양식 감춤
        } else if(imgloc == "preImgSec4") {
        	alert("arrive if 4");
        	file = $(this).prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('#preImgSec4 img').attr('src', blobURL);
            $('#preImgSec4').slideDown(); //업로드한 이미지 미리보기 
            $(this).slideUp(); //파일 양식 감춤
        }

	 });
});
</script>
<body>
	<!-- header -->
	<jsp:include page="inc/top.jsp" flush="false" />
	
	<!-- body -->
	<div class="bodySec">
		<div class="bodyInSec">
		
			<!-- left -->
			<div class="leftSec">
				<jsp:include page="inc/left.jsp" flush="false" />
			</div>
			
			<!-- right content -->
			<div class="rightSec">
				<div class="contentSec">
					<div class="contentInSec">
					
						<!-- top location -->
						<div class="locationSec">
							<ul>
								<li>현재위치 :</li>
								<li>마케팅센터 &gt;</li>
								<li>기업회원 가입 &gt;</li>
								<li>정보입력</li>
							</ul>
						</div>
						
						<div class="tWidth"></div>
						
						<!-- addChiefInfo start -->
						<form id="formLogin" action="<c:url value='/chief/chiefNShopInsertFrom.do'/>" name="chiefNShopInsertFrom" method="post" confirmmessage="입력하신 정보로 가입하시겠습니까?" enctype="multipart/form-data" class="_autoValidateForm">
							<div class="titTabSec">
								<h2>로그인 정보</h2>
							</div>
							<div class="boardList1 mgb30">
								<table class="form">
									<colgroup>
										<col width="160">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th><strong>회원 ID(Email)</strong><span class="required">*</span></th>
											<td><div class="inSec">
												<input id="C_EMAIL" value="ID를 입력해주세요." type="text" fieldname="아이디(email)" maxlength="20" minlength="4" restrictutf8bytes="20" class="input_click_init" onkeyup="this.form.checkId.value = 'N'" style="width: 200px; text-transform: lowercase;">
												<a href="javascript:;" id="idcheck" name="idcheck" class="sys-btn sys-btn-type3">중복검사</a>
												<span id="idChkResult" class="mgl10">id를 입력 후 중복검사를 진행해 주세요.</span>
											</div></td>
										</tr>
										<tr>
											<th><strong>비밀번호</strong><span class="required">*</span></th>
											<td><div class="inSec">
												<div class="inp2Sec">
													<div class="fleft">
														<input id="C_PWD" name="C_PWD" value="" type="password" fieldname="비밀번호" maxlength="20" minlength="4" restrictutf8bytes="20" class="input_click_init" style="width: 200px;">
														<input id="C_PWD-re" name="C_PWD-re" value="" type="password" id="label-pw" maxlength="20" minlength="4" restrictutf8bytes="20" equaltoel="passwd" class="input_click_init" style="width: 200px;">
														<label id="C_PWD_RESULT">비밀번호 확인 결과</label>
													</div>
												</div>
											</div></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="titTabSec">
								<h2>쇼핑몰 기본 정보</h2>
							</div>
							<div class="boardList1 mgb30">
								<table class="form view">
									<colgroup>
										<col width="160">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th><strong>쇼핑몰명</strong><span class="required">*</span></th>
											<td><div class="inSec"><input id="S_NAME" name="shopName" value="" type="text" fieldname="쇼핑몰명" restrictutf8bytes="45" class="input_click_init" style="width: 50%;"></div></td>
										</tr>
										<tr>
											<th><strong>쇼핑몰 도메인</strong><span class="required">*</span></th>
											<td><div class="inSec"><input id="S_DOMAIN" name="shopDomain" value="" type="text" fieldname="쇼핑몰 도메인" checkfunctionname="checkDomain" maxlength="50" class="input_click_init" style="width: 400px; text-transform: lowercase;">
												<br>※ <strong>http://</strong> 및 <strong>www.</strong> 미포함
												<br>http://www.sta1.com (<strong style="color:#ff0000">X</strong>)
												<br>http://sta1.com (<strong style="color:#ff0000">X</strong>)
												<br>www.sta1.com (<strong style="color:#ff0000">X</strong>)
												<br>sta1.com (<strong style="color:#0000ff">O</strong>)
											</div></td>
										</tr>
										<!-- <tr>
											<th><strong>모바일 사이트 유무</strong><span class="required">*</span></th>
											<td colspan="3"><div class="inSec">
												<ul>
													<li><label><input id="S_MSYN" name="mobYn" value="Y" type="radio" fieldname="모바일 사이트 유무" checked="checked" class="__required" onclick="changeMobYn('Y')"> 모바일 사이트가 있습니다.</label></li>
													<li><label><input id="S_MSYN" name="mobYn" value="N" type="radio" fieldname="모바일 사이트 유무" class="__required" onclick="changeMobYn('N')"> 모바일 사이트가 없거나 운영하지 않습니다.</label></li>
												</ul>
											</div></td>
										</tr>
										<tr>
											<th><strong>모바일 광고 여부</strong><span class="required">*</span></th>
											<td colspan="3"><div class="inSec">
												<ul>
													<li><label><input name="mobAdYn" value="Y" type="radio" fieldname="모바일 광고 여부" class="__required" checked="checked"> 모바일 웹에 진행하는 광고를 노출합니다.</label></li>
													<li><label><input name="mobAdYn" value="N" type="radio" fieldname="모바일 광고 여부" class="__required"> 모바일 웹에는 광고를 노출하지 않습니다.</label></li>
												</ul>
											</div></td>
										</tr>
										<tr>
											<th><strong>쇼핑몰 모바일 도메인</strong><span class="required">*</span></th>
											<td><div class="inSec"><input name="shopMobDomain" value="" type="text" fieldname="쇼핑몰 도메인" maxlength="50" class="htxt1 __required __toLowerCase mgb10" style="width: 400px; text-transform: lowercase;">
												<br>※ 대부분의 경우 m.sta1.com 또는 www.sta1.com/m/ 으로 입력하시면 됩니다. (실제 모바일 사이트를 확인하시고 입력하세요.)
											</div></td>
										</tr>
										<tr>
											<th><strong>웹 쇼핑몰 연결 URL</strong><span class="required">*</span></th>
											<td><div class="inSec"><input name="webUrl" value="http://" type="text" fieldname="웹 쇼핑몰 연결 URL 주소" restrictutf8bytes="80" forcestartwith="http://" checkfunctionname="checkUrl" class="htxt1 __required __noQuestionMark __noAmpersand" style="width: 400px;">
											<span class="mgl10">http:// 로 시작하는 완전한 URL을 입력하세요. (추적코드는 입력하지마세요.)</span>
											</div></td>
										</tr>
										<tr>
											<th><strong>모바일 쇼핑몰 연결 URL</strong><span class="required">*</span></th>
											<td><div class="inSec"><input name="mobUrl" value="http://" type="text" fieldname="모바일 쇼핑몰 연결 URL 주소" restrictutf8bytes="80" forcestartwith="http://" checkfunctionname="checkUrl" class="htxt1 __required __noQuestionMark __noAmpersand" style="width: 400px;">
											<span class="mgl10">http:// 로 시작하는 완전한 URL을 입력하세요. 모바일 URL이 없으면 웹과 동일하게 입력하세요. (추적코드는 입력하지마세요.)</span>
											</div></td>
										</tr> -->
										<tr>
											<th><strong>쇼핑몰 대표 이미지</strong><span class="required">*</span></th>
											<td><div class="inSec">
												<div class="imgInputSec mgb30">
													<p class="tit">일반 쇼핑몰 대표 이미지</p>
													<div id="preImgSec1" class="noImgSec" style="width: 115px; height: 170px;">
													</div>
													<div id="preImgSec2" class="noImgSec" style="width: 115px; height: 170px; float:left;">
													</div>
													<div class="hspace1"></div>
													<ul class="mgb10">
														<li>* 등록하실 이미지 사이즈는 230*340 픽셀로 등록하셔야 합니다.</li>
														<li>* 쇼핑몰 대표 이미지 선택은 최대 2개까지 가능합니다.</li>
													</ul>
													<div class="file">
														<input type="text" class="htxt1" style="width: 300px;" readonly="readonly">
														<input id="logoFile1" name="logoFile1" type="file" accept=".jpg,.png,.gif,.jpeg" class="img_file_onchange" >
													</div>
													<div class="file">
														<input type="text" class="htxt1" style="width: 300px;" readonly="readonly">
														<input id="logoFile2" name="logoFile2" type="file" accept=".jpg,.png,.gif,.jpeg" class="img_file_onchange" >
													</div>
												</div>
												<div class="imgInputSec mgb30">
													<p class="tit">광고용 쇼핑몰 대표 이미지</p>
													<div id="preImgSec3" class="noImgSec2" style="width: 236px; height: 170px;"></div>
													<div id="preImgSec4" class="noImgSec2" style="width: 236px; height: 170px;"></div>
													<div class="hspace1"></div>
													<ul class="mgb10">
														<li>* 등록하실 이미지 사이즈는 472*340 픽셀로 등록하셔야 합니다.</li>
														<li>* 쇼핑몰 대표 이미지 선택은 최대 2개까지 가능합니다.</li>
													</ul>
													<div class="file">
														<input type="text" class="htxt1" style="width: 300px;" readonly="readonly">
														<a href="javascript:;" class="sys-btn sys-btn-type3">찾아보기</a>
														<input name="adLogoFile1" type="file" accept=".jpg,.png,.gif,.jpeg" class="img_file_onchange" >
													</div>
													<div class="file">
														<input type="text" class="htxt1" style="width: 300px;" readonly="readonly">
														<a href="javascript:;" class="sys-btn sys-btn-type3">찾아보기</a>
														<input name="adLogoFile2" type="file" accept=".jpg,.png,.gif,.jpeg" class="img_file_onchange" >
													</div>
												</div>
											</div></td>
										</tr>
										<tr>
											<th><strong>유입 추적코드</strong></th>
											<td colspan="3"><div class="inSec">
												<table class="form" style="width:960px">
													<colgroup>
														<col width="120">
														<col width="120">
														<col width="720">
													</colgroup>
													<thead>
														<tr>
															<th>유입 매체</th>
															<th>클릭 대상</th>
															<th>추적 코드</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th rowspan="2">데스크톱 (PC)</th>
															<td>쇼핑몰</td>
															<td class="tleft"><div class="inSec">
																<input name="webShopTraceCode" value="" type="text" restrictutf8bytes="60" fieldname="데스크톱에서 쇼핑몰 유입 추적코드" class="htxt1 __noSpace" style="width:400px;" onkeyup="inputShopTrackingCode(this);"> (60 byte) 변수명=변수값 형식 ☞ trackingCode=123
															</div></td>
														</tr>
														<tr>
															<td>상품</td>
															<td class="tleft"><div class="inSec">
																<input name="webProdTraceCode" value="" type="text" restrictutf8bytes="60" fieldname="데스크톱에서 상품 유입 추적코드" class="htxt1 __noSpace" style="width:400px;" onkeyup="inputShopTrackingCode(this);"> (60 byte) 변수명=변수값 형식 ☞ trackingCode=123
															</div></td>
														</tr>
														<tr>
															<th rowspan="2">모바일</th>
															<td>쇼핑몰</td>
															<td class="tleft"><div class="inSec">
																<input name="mobShopTraceCode" value="" type="text" restrictutf8bytes="60" fieldname="모바일에서 쇼핑몰 유입 추적코드" class="htxt1 __noSpace" style="width:400px;" onkeyup="inputShopTrackingCode(this);"> (60 byte) 변수명=변수값 형식 ☞ trackingCode=123
															</div></td>
														</tr>
														<tr>
															<td>상품</td>
															<td class="tleft"><div class="inSec">
																<input name="mobProdTraceCode" value="" type="text" restrictutf8bytes="60" fieldname="모바일에서 상품 유입 추적코드" class="htxt1 __noSpace" style="width:400px;" onkeyup="inputShopTrackingCode(this);"> (60 byte) 변수명=변수값 형식 ☞ trackingCode=123
															</div></td>
														</tr>
													</tbody>
												</table>
												<ul class="mgt10">
													<li>* 쇼핑몰 유입 체크를 위한 추적 코드 입니다. 변수명=값 <em class="pt_1">(ex : cafe_mkt=sta1com)</em></li>
												</ul>
											</div></td>
										</tr>
										<tr>
											<th><strong>일반 쇼핑몰 설명 문구</strong><span class="required">*</span></th>
											<td><div class="inSec">
												<label for="label-txt1" class="label-txt1 hd-lab">공백포함 40자</label>
												<input name="shopDescription" value="" type="text" fieldname="일반 쇼핑몰 설명 문구" restrictutf8bytes="90" id="label-txt1" class="htxt1 hd-lab __required" style="width: 95%;">
											</div></td>
										</tr>
										<tr>
											<th><strong>광고 쇼핑몰 설명 문구</strong><span class="required">*</span></th>
											<td><div class="inSec">
												<label for="label-txt2" class="label-txt2 hd-lab">공백포함 90자</label>
												<input name="adShopDescription" value="" type="text" id="label-txt2" fieldname="광고 쇼핑몰 설명 문구" restrictutf8bytes="200" class="htxt1 hd-lab __required" style="width: 95%;">
											</div></td>
										</tr>
										<tr>
											<th><strong>호스팅사 선택</strong><span class="required">*</span></th>
											<td><div class="inSec">
												<ul class="inputList">
													<li><label><input name="hostingCode" value="01" type="radio" fieldname="호스팅사" class="__required" onclick="changeHostingCode(this.value);">메이크샵</label></li>
													<li><label><input name="hostingCode" value="02" type="radio" onclick="changeHostingCode(this.value);">카페24</label></li>
													<li><label><input name="hostingCode" value="03" type="radio" onclick="changeHostingCode(this.value);">고도몰</label></li>
													<li><label><input name="hostingCode" value="04" type="radio" onclick="changeHostingCode(this.value);">위사몰</label></li>
													<li><label><input name="hostingCode" value="05" type="radio" onclick="changeHostingCode(this.value);">후이즈몰</label></li>
													<li><label><input name="hostingCode" value="06" type="radio" onclick="changeHostingCode(this.value);">독립몰</label></li>
													<li><label><input name="hostingCode" value="99" type="radio" onclick="changeHostingCode(this.value);">기타</label></li>
												</ul>
											</div></td>
										</tr>
										<tr>
											<th><strong>호스팅사 기타</strong></th>
											<td><div class="inSec">
												<input name="hostingEtc" value="" type="text" fieldname="호스팅사 기타" restrictutf8bytes="30" class="htxt1" disabled="disabled" style="width: 100px;">
											</div></td>
										</tr>
										<tr>
											<th><strong>검색수 검색어</strong></th>
											<td><div class="inSec">
												<input name="nKeyword" value="" type="text" fieldname="검색수 검색어" restrictutf8bytes="45" class="htxt1 __required" style="width: 200px;">
												<span class="mgl10">검색수를 가져올 때 사용하는 검색어입니다. 일반적으로 쇼핑몰 이름을 입력하세요.</span>
											</div></td>
										</tr>
										<tr>
											<th><strong>쿠폰 등록 URL</strong></th>
											<td><div class="inSec"><input name="couponRegUrl" value="" type="text" fieldname="쿠폰 등록 URL 주소" restrictutf8bytes="100" forcestartwith="http://" checkfunctionname="checkUrl" class="htxt1 __noQuestionMark __noAmpersand" style="width: 600px;">
											<span class="mgl10">쿠폰 광고 진행시 필요한 쿠폰 등록 URL 입니다.</span>
											</div></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="titTabSec">
								<h2>쇼핑몰 속성</h2>
							</div>
							<div class="boardList1 mgb30">
								<table class="form">
									<colgroup>
										<col width="160">
										<col width="450">
										<col width="160">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th><strong>성별</strong><span class="required">*</span></th>
											<td><div class="inSec">
												<ul class="inputList">
													<li><label><input name="kindCode" value="F" type="radio" fieldname="성별" class="__required" onclick="changeShopKindCode(this.value);">여성 쇼핑몰</label></li>
													<li><label><input name="kindCode" value="M" type="radio" onclick="changeShopKindCode(this.value);">남성 쇼핑몰</label></li>
												</ul>
											</div></td>
											<th><strong>연령대</strong><span class="required">*</span></th>
											<td><div class="inSec">
												<ul class="inputList">
													<li><label><input name="ageCateSeqs" value="101" type="checkbox" fieldname="연령대" class="_age_cate __required">10대</label></li>
													<li><label><input name="ageCateSeqs" value="102" type="checkbox" fieldname="연령대" class="_age_cate __required">20대</label></li>
													<li><label><input name="ageCateSeqs" value="103" type="checkbox" fieldname="연령대" class="_age_cate __required">30대</label></li>
												</ul>
											</div></td>
										</tr>
										<tr>
											<th><strong>스타일 &amp; 전문샵 (여성)</strong></th>
											<td><div class="inSec">
												<ul>
													<li><label><input name="styleCateSeqs" value="201" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_F">러블리</label></li>
													<li><label><input name="styleCateSeqs" value="202" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_F">섹시</label></li>
													<li><label><input name="styleCateSeqs" value="204" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_F">모던시크</label></li>
													<li><label><input name="styleCateSeqs" value="214" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_F">페미닌</label></li>
													<li><label><input name="styleCateSeqs" value="203" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_F">럭셔리·명품</label></li>
													<li><label><input name="styleCateSeqs" value="215" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_F">심플베이직</label></li>
													<li><label><input name="styleCateSeqs" value="205" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_F">유니크</label></li>
													<li><label><input name="styleCateSeqs" value="206" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_F">십대쇼핑몰</label></li>
													<li><label><input name="styleCateSeqs" value="207" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_F">미시스타일</label></li>
													<li><label><input name="styleCateSeqs" value="208" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_F">빅사이즈</label></li>
													<li><label><input name="styleCateSeqs" value="212" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_F">란제리·언더웨어</label></li>
													<li><label><input name="styleCateSeqs" value="209" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_F">슈즈</label></li>
													<li><label><input name="styleCateSeqs" value="210" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_F">가방</label></li>
													<li><label><input name="styleCateSeqs" value="211" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_F">액세서리·잡화</label></li>
													<li><label><input name="styleCateSeqs" value="213" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_F">커플룩·비치룩</label></li>
												</ul>
											</div></td>
											<th><strong>스타일 &amp; 전문샵 (남성)</strong></th>
											<td style="vertical-align:top"><div class="inSec">
												<ul>
													<li><label><input name="styleCateSeqs" value="301" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_M">트랜드</label></li>
													<li><label><input name="styleCateSeqs" value="304" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_M">레플·자체제작</label></li>
													<li><label><input name="styleCateSeqs" value="302" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_M">유니크·빈티지</label></li>
													<li><label><input name="styleCateSeqs" value="303" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_M">옴므·클래식·수트</label></li>
													<li><label><input name="styleCateSeqs" value="307" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_M">빅사이즈</label></li>
													<li><label><input name="styleCateSeqs" value="305" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_M">슈즈</label></li>
													<li><label><input name="styleCateSeqs" value="306" type="checkbox" fieldname="스타일·전문샵" class="_style_cate _style_cate_M">액세서리·잡화</label></li>
												</ul>
											</div></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="titTabSec">
								<h2>담당자 정보</h2>
							</div>
							<div class="boardList1 mgb30">
								<table class="form">
									<colgroup>
										<col width="160">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th><strong>담당자 성명</strong><span class="required">*</span></th>
											<td><div class="inSec"><input name="contactName" value="" type="text" fieldname="담당자 성명" restrictutf8bytes="30" class="htxt1 __required" style="width: 182px;"></div></td>
										</tr>
										<tr>
											<th><strong>부서명</strong><span class="required">*</span></th>
											<td><div class="inSec"><input name="contactPart" value="" type="text" fieldname="담당자 부서명" restrictutf8bytes="30" class="htxt1 __required" style="width: 182px;"></div></td>
										</tr>
										<tr>
											<th><strong>직급/직책</strong><span class="required">*</span></th>
											<td><div class="inSec"><input name="contactDuty" value="" type="text" fieldname="담당자 직급/직책" restrictutf8bytes="30" class="htxt1 __required" style="width: 182px;"></div></td>
										</tr>
										<tr>
											<th><strong>담당자 전화번호</strong></th>
											<td><div class="inSec">
												<div class="jqTransformSelectWrapper" style="z-index: 12; width: 128px;">
													<div>
														<span style="width: 100px;">서울 (02)</span>
														<a href="#" class="jqTransformSelectOpen"></a>
													</div>
													<ul style="width: 126px; display: none; visibility: visible;">
														<li><a href="#" index="0" class="selected">서울 (02)</a></li>
														<li><a href="#" index="1">경기 (031)</a></li>
														<li><a href="#" index="2">인천 (032)</a></li>
														<li><a href="#" index="3">강원 (033)</a></li>
														<li><a href="#" index="4">충남 (041)</a></li>
														<li><a href="#" index="5">대전 (042)</a></li>
														<li><a href="#" index="6">충북 (043)</a></li>
														<li><a href="#" index="7">부산 (051)</a></li>
														<li><a href="#" index="8">울산 (052)</a></li>
														<li><a href="#" index="9">대구 (053)</a></li>
														<li><a href="#" index="10">경북 (054)</a></li
														><li><a href="#" index="11">경남 (055)</a></li>
														<li><a href="#" index="12">전남 (061)</a></li>
														<li><a href="#" index="13">광주 (062)</a></li>
														<li><a href="#" index="14">전북 (063)</a></li>
														<li><a href="#" index="15">제주 (064)</a></li>
														<li><a href="#" index="16">휴대폰 (010)</a></li>
														<li><a href="#" index="17">휴대폰 (011)</a></li>
														<li><a href="#" index="18">휴대폰 (016)</a></li>
														<li><a href="#" index="19">휴대폰 (017)</a></li>
														<li><a href="#" index="20">휴대폰 (018)</a></li>
														<li><a href="#" index="21">휴대폰 (019)</a></li>
														<li><a href="#" index="22">인터넷 전화 (070)</a></li>
														<li><a href="#" index="23">통합메시징 (030)</a></li>
														<li><a href="#" index="24">개인번호 (050)</a></li>
														<li><a href="#" index="25">음성정보 (060)</a></li>
														<li><a href="#" index="26">착신과금 (080)</a></li>
														<li><a href="#" index="27">한국통신 (0502)</a></li>
														<li><a href="#" index="28">온세텔레콤 (0503)</a></li>
														<li><a href="#" index="29">온세텔레콤 (0504)</a></li>
														<li><a href="#" index="30">데이콘 (0505)</a></li>
														<li><a href="#" index="31">SK텔레콤 (0506)</a></li>
														<li><a href="#" index="32">온세텔레콤 (0507)</a></li>
													</ul>
													<select name="contactPhone1" fieldname="담당자 전화번호 지역번호" class="__required jqTransformHidden" zidx="12" style="width: 100px;">
														<option value="02" selected="selected">서울 (02)</option>
														<option value="031">경기 (031)</option>
														<option value="032">인천 (032)</option>
														<option value="033">강원 (033)</option>
														<option value="041">충남 (041)</option>
														<option value="042">대전 (042)</option>
														<option value="043">충북 (043)</option>
														<option value="051">부산 (051)</option>
														<option value="052">울산 (052)</option>
														<option value="053">대구 (053)</option>
														<option value="054">경북 (054)</option>
														<option value="055">경남 (055)</option>
														<option value="061">전남 (061)</option>
														<option value="062">광주 (062)</option>
														<option value="063">전북 (063)</option>
														<option value="064">제주 (064)</option>
														<option value="010">휴대폰 (010)</option>
														<option value="011">휴대폰 (011)</option>
														<option value="016">휴대폰 (016)</option>
														<option value="017">휴대폰 (017)</option>
														<option value="018">휴대폰 (018)</option>
														<option value="019">휴대폰 (019)</option>
														<option value="070">인터넷 전화 (070)</option>
														<option value="030">통합메시징 (030)</option>
														<option value="050">개인번호 (050)</option>
														<option value="060">음성정보 (060)</option>
														<option value="080">착신과금 (080)</option>
														<option value="0502">한국통신 (0502)</option>
														<option value="0503">온세텔레콤 (0503)</option>
														<option value="0504">온세텔레콤 (0504)</option>
														<option value="0505">데이콘 (0505)</option>
														<option value="0506">SK텔레콤 (0506)</option>
														<option value="0507">온세텔레콤 (0507)</option>
													</select>
												</div> -
												<input name="contactPhone2" value="" type="text" fieldname="담당자 전화번호 국번" minlength="3" maxlength="4" class="htxt1 __required __onlyNumber" style="width: 80px;"> -
												<input name="contactPhone3" value="" type="text" fieldname="담당자 전화번호 뒷자리" exactlength="4" maxlength="4" class="htxt1 __required __onlyNumber" style="width: 80px;">
											</div></td>
										</tr>
										<tr>
											<th><strong>담당자 휴대폰</strong></th>
											<td><div class="inSec">
												<div class="jqTransformSelectWrapper" style="z-index: 11; width: 94px;">
													<div>
														<span style="width: 66px;">010</span>
														<a href="#" class="jqTransformSelectOpen"></a>
													</div>
													<ul style="width: 92px; display: none; visibility: visible;">
														<li><a href="#" index="0" class="selected">010</a></li>
														<li><a href="#" index="1">011</a></li>
														<li><a href="#" index="2">016</a></li
														><li><a href="#" index="3">017</a></li>
														<li><a href="#" index="4">018</a></li
														><li><a href="#" index="5">019</a></li>
													</ul>
													<select name="contactMobile1" fieldname="담당자 휴대폰 지역번호" class="__required jqTransformHidden" zidx="11" style="width: 66px;">
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="018">018</option>
														<option value="019">019</option>
													</select>
												</div> -
												<input name="contactMobile2" value="" type="text" fieldname="담당자 휴대폰 국번" minlength="3" maxlength="4" class="htxt1 __required __onlyNumber" style="width: 80px;"> -
												<input name="contactMobile3" value="" type="text" fieldname="담당자 휴대폰 뒷자리" exactlength="4" maxlength="4" class="htxt1 __required __onlyNumber" style="width: 80px;">
											</div></td>
										</tr>
										<tr>
											<th><strong>이메일</strong><span class="required">*</span></th>
											<td><div class="inSec">
												<div class="fleft mgr5">
													<input name="contactEmailId" value="" type="text" fieldname="담당자 이메일 아이디" restrictutf8bytes="20" maxlength="20" class="htxt1 __required" style="width: 182px;"> @
													<input name="contactEmailDomain" value="" type="text" fieldname="담당자 이메일 아이디" checkfunctionname="checkDomain" restrictutf8bytes="39" maxlength="39" class="htxt1 mailSelectInput __required" style="width: 150px;">
												</div>
												<div class="jqTransformSelectWrapper" style="z-index: 10; width: 112px;">
													<div>
														<span style="width: 84px;">직접입력</span>
														<a href="#" class="jqTransformSelectOpen"></a>
													</div>
													<ul style="width: 110px; display: none; visibility: visible;">
														<li><a href="#" index="0" class="selected">직접입력</a></li>
														<li><a href="#" index="1">네이버</a></li>
														<li><a href="#" index="2">다음</a></li>
														<li><a href="#" index="3">네이트</a></li>
														<li><a href="#" index="4">구글</a></li>
														<li><a href="#" index="5">핫메일</a></li>
														<li><a href="#" index="6">코리아닷컴</a></li>
														<li><a href="#" index="7">천리안</a></li>
														<li><a href="#" index="8">드림위즈</a></li>
														<li><a href="#" index="9">엠파스</a></li>
													</ul>
													<select onchange="selectMail($(this))" zidx="10" class="jqTransformHidden">
														<option value="0">직접입력</option>
														<option value="naver.com">네이버</option>
														<option value="daum.net">다음</option>
														<option value="nate.com">네이트</option>
														<option value="gmail.com">구글</option>
														<option value="hotmail.com">핫메일</option>
														<option value="korea.com">코리아닷컴</option>
														<option value="chol.com">천리안</option>
														<option value="dreamwiz.com">드림위즈</option>
														<option value="empas.com">엠파스</option>
													</select>
												</div>
											</div></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="titTabSec">
								<h2>세금계산서 정보</h2>
							</div>
							<div class="boardList1 mgb30">
								<table class="form">
									<colgroup>
										<col width="160">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th><strong>회사명</strong><span class="required">*</span></th>
											<td><div class="inSec"><input value="asdf" type="text" class="htxt1" readonly="readonly" style="width: 182px;"></div></td>
										</tr>
										<tr>
											<th><strong>대표자명</strong><span class="required">*</span></th>
											<td><div class="inSec"><input name="presidentName" value="" type="text" fieldname="대표자명" restrictutf8bytes="20" class="htxt1 __required __noSpace" style="width: 182px;"></div></td>
										</tr>
										<tr>
											<th><strong>사업자등록번호</strong><span class="required">*</span></th>
											<td><div class="inSec">
												<input value="142" type="text" class="htxt1 tcenter" style="width: 30px;" readonly="readonly"> -
												<input value="07" type="text" class="htxt1 tcenter" style="width: 20px;" readonly="readonly"> -
												<input value="80990" type="text" class="htxt1 tcenter" style="width: 50px;" readonly="readonly">
											</div></td>
										</tr>
										<tr>
											<th><strong>사업자등록증 제출</strong><span class="required">*</span></th>
											<td><div class="inSec">
												<ul class="inputList">
													<li><label><input name="licenseType" value="I" type="radio" onclick="changeLicenseType(this.value)" checked="checked">이미지 첨부</label></li>
													<li><label><input name="licenseType" value="F" type="radio" onclick="changeLicenseType(this.value)">팩스 전송</label></li>
												</ul>
												<p class="pdt10 pt_1 ft11">*사업자 등록증 사본은 반드시 파일 첨부 또는 팩스를 이용하여 보내주셔야 쇼핑몰 등록 심사를 받으실 수 있습니다.<br>
												* 스타일닷컴 팩스 번호 : 02-515-3442</p>
											</div></td>
										</tr>
										<tr class="_license_type_I">
											<th class="_license_type_I"><strong>사업자등록증 첨부</strong></th>
											<td class="_license_type_I"><div class="inSec">
												<div class="file">
													<input type="text" class="htxt1" style="width: 300px;" readonly="readonly">
													<a href="javascript:;" class="sys-btn sys-btn-type3">찾아보기</a>
													<input name="licenseFile" type="file" allowfileext="jpeg,jpg,gif,png" fieldname="사업자등록증 사본" class="hfile1 opa0 __required">
												</div>
											</div></td>
										</tr>
										<tr>
											<th><strong>이메일</strong><span class="required">*</span></th>
											<td><div class="inSec">
												<div class="fleft mgr5"><input name="comEmailId" value="" type="text" fieldname="세금계산서 이메일 아이디" restrictutf8bytes="20" maxlength="20" class="htxt1 __required" style="width: 182px;"> @
												<input name="comEmailDomain" value="" type="text" fieldname="세금계산서 이메일 도메인" checkfunctionname="checkDomain" restrictutf8bytes="39" maxlength="39" class="htxt1 mailSelectInput __required" style="width: 150px;"></div>
												<div class="jqTransformSelectWrapper" style="z-index: 7; width: 133px;"><div><span style="width: 105px;">직접입력</span><a href="#" class="jqTransformSelectOpen"></a></div><ul style="width: 131px; display: none; visibility: visible;"><li><a href="#" index="0" class="selected">직접입력</a></li><li><a href="#" index="1">naver.com</a></li><li><a href="#" index="2">nate.com</a></li><li><a href="#" index="3">lycos.co.kr</a></li><li><a href="#" index="4">korea.com</a></li><li><a href="#" index="5">hotmail.com</a></li><li><a href="#" index="6">paran.com</a></li><li><a href="#" index="7">gmail.com</a></li><li><a href="#" index="8">chollian.net</a></li><li><a href="#" index="9">dreamwiz.com</a></li><li><a href="#" index="10">empal.com</a></li></ul><select onchange="selectMail($(this))" class="jqTransformHidden">
													<option value="0">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="nate.com">nate.com</option>
													<option value="lycos.co.kr">lycos.co.kr</option>
													<option value="korea.com">korea.com</option>
													<option value="hotmail.com">hotmail.com</option>
													<option value="paran.com">paran.com</option>
													<option value="gmail.com">gmail.com</option>
													<option value="chollian.net">chollian.net</option>
													<option value="dreamwiz.com">dreamwiz.com</option>
													<option value="empal.com">empal.com</option>
												</select></div>
											</div></td>
										</tr>
										<tr>
											<th><strong>사업장주소</strong><span class="required">*</span></th>
											<td colspan="3"><div class="inSec">
												<p class="br">
													<input name="comZonecode" type="text" fieldname="사업장 우편번호" class="htxt1 mgr5 __required" style="width: 50px;" readonly="readonly">
													<a href="javascript:;" onclick="searchZonecode(); searchZip='Company'" class="sys-btn sys-btn-type3">우편번호 검색</a>
												</p>
												<p class="br">지 &nbsp; &nbsp; &nbsp; 번 : <input name="comBaseAddress" value="" type="text" fieldname="사업장 기본주소" class="htxt1" style="width: 90%;" readonly="readonly"></p>
												<p class="br">도로명 : <input name="comRdBaseAddress" value="" type="text" fieldname="사업장 기본주소" class="htxt1" style="width: 90%;" readonly="readonly"></p>
												<p class="br">상 &nbsp; &nbsp; &nbsp; 세 : <input name="comRdDtlAddress" value="" type="text" fieldname="사업장 상세주소" restrictutf8bytes="100" class="htxt1" style="width: 90%;"></p>
											</div></td>
										</tr>
										<tr>
											<th><strong>업태</strong><span class="required">*</span></th>
											<td colspan="3"><div class="inSec">
												<input name="bizType" value="" type="text" fieldname="업태" restrictutf8bytes="60" class="htxt1 __required" style="width: 182px;">
											</div></td>
										</tr>
										<tr>
											<th><strong>종목</strong><span class="required">*</span></th>
											<td colspan="3"><div class="inSec">
												<input name="bizCondition" value="" type="text" fieldname="업종" restrictutf8bytes="60" class="htxt1 __required" style="width: 182px;">
											</div></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="titTabSec">
								<h2>고객센터 정보</h2>
							</div>
							<div class="boardList1 mgb30">
								<table class="form">
									<colgroup>
										<col width="160">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th><strong>고객센터 주소</strong><span class="required">*</span></th>
											<td colspan="3"><div class="inSec">
												<p class="br">
													<input name="csZonecode" type="text" fieldname="고객센터 우편번호" class="htxt1 mgr5 __required" style="width: 50px;" readonly="readonly">
													<a href="javascript:;" onclick="searchZonecode(); searchZip='Cs'" class="sys-btn sys-btn-type3">우편번호 검색</a>
													<a href="javascript:;" onclick="copyCompanyAddress();" class="sys-btn sys-btn-type3">사업장 정보와 동일</a>
												</p>
												<p class="br">지 &nbsp; &nbsp; &nbsp; 번 : <input name="csBaseAddress" value="" type="text" fieldname="고객센터 기본주소" class="htxt1" style="width: 90%;" readonly="readonly"></p>
												<p class="br">도로명 : <input name="csRdBaseAddress" value="" type="text" fieldname="고객센터 기본주소" class="htxt1" style="width: 90%;" readonly="readonly"></p>
												<p class="br">상 &nbsp; &nbsp; &nbsp; 세 : <input name="csRdDtlAddress" value="" type="text" fieldname="고객센터 상세주소" restrictutf8bytes="100" class="htxt1" style="width: 90%;"></p>
											</div></td>
										</tr>
										<tr>
											<th><strong>고객센터 대표번호</strong><span class="required">*</span></th>
											<td colspan="3"><div class="inSec">
												<div class="jqTransformSelectWrapper" style="z-index: 6; width: 148px;"><div><span style="width: 120px;">서울 (02)</span><a href="#" class="jqTransformSelectOpen"></a></div><ul style="width: 146px; display: none; visibility: visible;"><li><a href="#" index="0" class="selected">서울 (02)</a></li><li><a href="#" index="1">경기 (031)</a></li><li><a href="#" index="2">인천 (032)</a></li><li><a href="#" index="3">강원 (033)</a></li><li><a href="#" index="4">충남 (041)</a></li><li><a href="#" index="5">대전 (042)</a></li><li><a href="#" index="6">충북 (043)</a></li><li><a href="#" index="7">부산 (051)</a></li><li><a href="#" index="8">울산 (052)</a></li><li><a href="#" index="9">대구 (053)</a></li><li><a href="#" index="10">경북 (054)</a></li><li><a href="#" index="11">경남 (055)</a></li><li><a href="#" index="12">전남 (061)</a></li><li><a href="#" index="13">광주 (062)</a></li><li><a href="#" index="14">전북 (063)</a></li><li><a href="#" index="15">제주 (064)</a></li><li><a href="#" index="16">휴대폰 (010)</a></li><li><a href="#" index="17">휴대폰 (011)</a></li><li><a href="#" index="18">휴대폰 (016)</a></li><li><a href="#" index="19">휴대폰 (017)</a></li><li><a href="#" index="20">휴대폰 (018)</a></li><li><a href="#" index="21">휴대폰 (019)</a></li><li><a href="#" index="22">인터넷 전화 (070)</a></li><li><a href="#" index="23">통합메시징 (030)</a></li><li><a href="#" index="24">개인번호 (050)</a></li><li><a href="#" index="25">음성정보 (060)</a></li><li><a href="#" index="26">착신과금 (080)</a></li><li><a href="#" index="27">한국통신 (0502)</a></li><li><a href="#" index="28">온세텔레콤 (0503)</a></li><li><a href="#" index="29">온세텔레콤 (0504)</a></li><li><a href="#" index="30">데이콘 (0505)</a></li><li><a href="#" index="31">SK텔레콤 (0506)</a></li><li><a href="#" index="32">온세텔레콤 (0507)</a></li></ul><select name="csPhone1" fieldname="고객센터 대표번호 지역번호" class="__required jqTransformHidden">
													<option value="02">서울 (02)</option>
			<option value="031">경기 (031)</option>
			<option value="032">인천 (032)</option>
			<option value="033">강원 (033)</option>
			<option value="041">충남 (041)</option>
			<option value="042">대전 (042)</option>
			<option value="043">충북 (043)</option>
			<option value="051">부산 (051)</option>
			<option value="052">울산 (052)</option>
			<option value="053">대구 (053)</option>
			<option value="054">경북 (054)</option>
			<option value="055">경남 (055)</option>
			<option value="061">전남 (061)</option>
			<option value="062">광주 (062)</option>
			<option value="063">전북 (063)</option>
			<option value="064">제주 (064)</option>
			<option value="010">휴대폰 (010)</option>
			<option value="011">휴대폰 (011)</option>
			<option value="016">휴대폰 (016)</option>
			<option value="017">휴대폰 (017)</option>
			<option value="018">휴대폰 (018)</option>
			<option value="019">휴대폰 (019)</option>
			<option value="070">인터넷 전화 (070)</option>
			<option value="030">통합메시징 (030)</option>
			<option value="050">개인번호 (050)</option>
			<option value="060">음성정보 (060)</option>
			<option value="080">착신과금 (080)</option>
			<option value="0502">한국통신 (0502)</option>
			<option value="0503">온세텔레콤 (0503)</option>
			<option value="0504">온세텔레콤 (0504)</option>
			<option value="0505">데이콘 (0505)</option>
			<option value="0506">SK텔레콤 (0506)</option>
			<option value="0507">온세텔레콤 (0507)</option>
			
												</select></div>
												- <input name="csPhone2" value="" fieldname="고객센터 대표번호 국번" type="text" minlength="3" maxlength="4" class="htxt1 __required __onlyNumber" style="width: 80px;">
												- <input name="csPhone3" value="" fieldname="고객센터 대표번호 뒷자리" type="text" exactlength="4" maxlength="4" class="htxt1 __required __onlyNumber" style="width: 80px;">
											</div></td>
										</tr>
										<tr>
											<th><strong>고객센터 업무시간</strong><span class="required">*</span></th>
											<td colspan="3"><div class="inSec">
												<input name="csBizTime" value="" type="text" restrictutf8bytes="100" fieldname="고객센터 업무시간" class="htxt1 __required" style="width:600px;"> (100 byte)
											</div></td>
										</tr>
										<tr>
											<th><strong>CEO 프로파일 이미지</strong></th>
											<td colspan="3"><div class="inSec">
												<div class="imgInputSec">
													<div id="preImgSec6" class="noImgSec" style="width: 60px; height: 60px;"></div>
													<div class="hspace1"></div>
													<ul class="mgb10">
														<li>* 등록하실 이미지 사이즈는 60*60 픽셀로 등록하셔야 합니다.</li>
													</ul>
													<div class="file">
														<input type="text" class="htxt1" style="width: 300px;" readonly="readonly">
														<a href="javascript:;" class="sys-btn sys-btn-type3">찾아보기</a>
														<input name="ceoProfileFile" type="file" class="hfile1 opa0" fieldname="CEO 프로파일 이미지" allowfileext="jpg,jpeg" onchange="previewImage(this,'preImgSec6', '60*60');">
													</div>
												</div>
											</div></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="tcenter">
								<input type="submit" value="기업회원 가입" class="sys-btn sys-btn-type2">
							</div>
							<input name="companyNumber" value="1420780990" type="hidden">
							<input name="contactPhone" value="" type="hidden">
							<input name="contactMobile" value="" type="hidden">
							<input name="contactEmail" value="" type="hidden">
							<input name="comEmail" value="" type="hidden">
							<input name="csPhone" value="" type="hidden">
							<input name="checkId" value="N" type="hidden">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
