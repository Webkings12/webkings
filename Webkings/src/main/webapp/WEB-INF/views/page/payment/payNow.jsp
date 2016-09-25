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
	
	$("#pay").click(function(){

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
		    name : '주문명:'+$("#pName").val(),  //주문명
		    amount : $("#price").val(),  //가격
		    buyer_email : $("#email").val(),  
		    buyer_name : $("#name").val(),
		    buyer_tel : $("#tel").val(),
		    buyer_addr : $("#address").val(),
		    buyer_postcode : $("#zipcode").val()
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid+"<br>";
		        msg += '상점 거래ID : ' + rsp.merchant_uid+"<br>";
		        msg += '결제 금액 : ' + rsp.paid_amount+"<br>";
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		 	
		    alert(msg);
		    $("#result").html(msg);
		});

		
	});
});



</script>
<style type="text/css">
.divFm{
	width: 700px;
	margin: 0 auto;
}
.divFm label, .divForm .sp1 {
    width: 20%;
    float: left;
    text-align: left;
    padding: 3px 15px 0 0;
    clear: left;
    font-weight: bold;
}
</style>
</head>
<body>
<div class="divFm">
	<form name="frmPay">
		<!-- <div class="">
			<label class="sp1">주문번호</label>
			<input type="text" name="pNo">
		</div> -->
		<div>
			<label class="sp1">결제명</label>
			<input type="text" name="pName" id="pName">
		</div>
		<div>
			<label class="sp1">금액</label>
			<input type="text" name="price" id="price">
		</div>
		<div>
			<label class="sp1">이메일주소</label>
			<input type="text" name="email" id="email">
		</div>
		<div>
			<label class="sp1">성함</label>
			<input type="text" name="name" id="name">
		</div>
		<div>
			<label class="sp1">주소</label>
			<input type="text" name="address" id="address">
		</div>
		<div>
			<label class="sp1">우편번호</label>
			<input type="text" name="zipcode" id="zipcode">
		</div>
		<div>
			<label class="sp1">연락처</label>
			<input type="text" name="tel" id="tel">
		</div>
		<input type="button" id="pay" value="결제">
		<!-- <input type="submit" value="결제"> -->
	</form>
	
	<div id="result">
	
	</div>
</div>
	


</body>
</html>