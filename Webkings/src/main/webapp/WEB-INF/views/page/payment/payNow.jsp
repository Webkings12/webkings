<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>
<script>

$(document).ready(function(){
	var cnt=0;
	$("#pay").click(function(){
		if($("#sName").val().length<1){
			alert("쇼핑몰 이름을 적으세요");
			$("#sName").focus();
			return;
		}else if($("#email").val().length<1){
			alert("이메일을 적으세요");
			$("#email").focus();
			return;
		}else if($("#name").val().length<1){
			alert("성함을 적으세요");
			$("#name").focus();
			return;
		}if($("#tel").val().length<1){
			alert("연락처를 적으세요");
			$("#tel").focus();
			return;
		}
		$.ajax({
			url:"<c:url value='/shop/checkShop.do' />",
			data: "shop="+$("#sName").val(),
			type:"GET",
			dataType:"json",
			success:function(res){
					if(res==1){
						//openShop();
						payment();
					}else{
						alert("쇼핑몰 이름이 잘못되었습니다.\n등록한 쇼핑몰 이름을 확인해주세요");
						$("#sName").focus();
					}
			},
			error:function(xhr,status,error){
				alert(status+" : "+error);
			}
		});	
		
	});
});

function payment(){
	var sDomain=$("#sName").val();
	var IMP = window.IMP;
	IMP.init('imp75014074'); //'iamport' 대신 부여받은 "가맹점 식별코드"를 사용.
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원. 
	        /*
	            'kakao':카카오페이,
	            'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제), 
	            'nice':나이스, 
	            'jtnet':jtnet, 
	            'uplus':LG유플러스,
	            'danal':다날
	        */
	    pay_method : 'card', // 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
	    merchant_uid : 'merchant_' + new Date().getTime(),  //주문번호인듯?
	    name : '쇼핑몰 : '+$("#sName").val(),  //조핑몰
	    amount : $("#price").val(),  //가격
	    buyer_email : $("#email").val(),  
	    buyer_name : $("#name").val(),
	    buyer_tel : $("#tel").val()
	    /* buyer_addr : $("#address").val(),
	    buyer_postcode : $("#zipcode").val() */
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid+"<br>";
	        msg += '상점 거래ID : ' + rsp.merchant_uid+"<br>";
	        msg += '결제 금액 : ' + rsp.paid_amount+"<br>";
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        openShop();
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	 	
	    $("#result").html(msg);
	});
}

function openShop(){
	var msg2="";
	$.ajax({
		url:"<c:url value='/shop/openShop.do' />",
		data: "shop="+$("#sName").val(),
		type:"GET",
		dataType:"json",
		success:function(res){
				
				if(res==1){
					msg2="등록 연장 30일";
					$("#result2").html(msg2);
				}else if(res==2){
					msg2="쇼핑몰 등록";
					$("#result2").html(msg2);
				}
		},
		error:function(xhr,status,error){
			alert(status+" : "+error);
		}
		
	});	
	
		
}

</script>
<style type="text/css">
.divFm{
	width: 400px;
	margin: 0 auto;
	border: 1px solid gray;
	padding:20px;
}
.divFm label, .divForm .sp1 {
    width: 30%;
    float: left;
    text-align: left;
    padding: 3px 15px 0 0;
    clear: left;
    font-weight: bold;
}
.divFm input[type=text]{
	text-align:right;
	width: 60%;
}

.divFm .divInput {
    clear: both;
    border-bottom: 1px solid #eee;
    padding: 5px 0;
    margin: 0;
    overflow: auto;
</style>
</head>
<body>
<div class="divFm">
	<form name="frmPay">
		<!-- <div class="">
			<label class="sp1">주문번호</label>
			<input type="text" name="pNo">
		</div> -->
		<div class="divInput">
			<label class="sp1">금액</label>
			<input type="text" name="price" id="price" value="50" readonly>
		</div>
		<div class="divInput">
			<label class="sp1">쇼핑몰 이름</label>
			<input type="text" name="sName" id="sName">
		</div>
		<div class="divInput">
			<label class="sp1">이메일주소</label>
			<input type="text" name="email" id="email">
		</div>
		<div class="divInput">
			<label class="sp1">성함</label>
			<input type="text" name="name" id="name">
		</div>
		<!-- <div class="divInput">
			<label class="sp1">주소</label>
			<input type="text" name="address" id="address">
		</div>
		<div class="divInput">
			<label class="sp1">우편번호</label>
			<input type="text" name="zipcode" id="zipcode">
		</div> -->
		<div class="divInput">
			<label class="sp1">연락처</label>
			<input type="text" name="tel" id="tel">
		</div>
		<div style="text-align: right;margin-top: 20px;">
		<input type="button" id="pay" value="결제" >
		</div>
	</form>
	
	<div id="result">
	
	</div>
	<div id="result2" style="text-align: center;">
	
	</div>
</div>
	


</body>
</html>