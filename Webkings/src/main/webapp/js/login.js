/**
 * 
 */
// 로그인
$(document).ready(function(){
	$("#regcancelbtn").prop("class","cancelbtn");
	$("#formLogin").submit(function(){
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
		}
		$("#divLogin").css("display","none");
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


// 회원가입

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#UploadedImg').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

//회원수정 사진

function readURL1(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#UploadedImg1').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

$(document).ready(function(){
	$("#form1").submit(function(){
		if(!chkEmail($("#mEmail").val())){
			alert("이메일형식에 맞게 입력하세요.");
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
		}else if ($("#certifyChk").val().length<1){
				alert("인증번호를 받으세요");
				$("#divreg").css("display","block");
				$("#aCertify").focus();
				return false
		}else if ($("#certify").val().length<1){
			alert("인증번호를 입력하세요");
			$("#divreg").css("display","block");
			$("#certify").focus();
			return false
		}else if ($("#certify").val()!=$("#certifyChk").val()){
			alert("인증번호가 다릅니다");
			$("#divreg").css("display","block");
			$("#certify").focus();
			return false
		}
		
		$("#divreg").css("display","none");
		
	});
	
	
});

//이용약관

$(document).ready(function(){
	var itemIn= 0;
	$(".tos label").click(function(){
		if($(this).parents(".tos").find("input[type=checkbox]").is(":checked")==true){
			$(this).prop('checked', false);
			$(this).parents(".tos").find("label").removeClass("active");
			itemIn+=-1;
		}else{
			$(this).prop('checked', true);
			$(this).parents(".tos").find("label").addClass("active");
			itemIn+=1;
		}
		if(itemIn==2){
			$("#regcancelbtn").prop("class", "active");
		}else{
			$("#regcancelbtn").prop("class","cancelbtn");
		}
	});
	
	
	

	/*$(".tos #tos2").click(function(event){
		if($("#tos2").is(":checked")==true){
			$(this).find("input[type=checkbox]").prop('checked', false);
			$(this).removeClass("active");
		}else{
			$(this).find("input[type=checkbox]").prop('checked', true);
			$(this).addClass("active");
		}
	});*/
	$(".amodel #regcancelbtn").click(function() {
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
		$(".tos label").removeClass("active");
		$("input[type=checkbox]").prop('checked', false) ;
		$("#regcancelbtn").prop("class","cancelbtn");
		$("#divreg").css("display","block");

	});
	
	$("#spantos").click(function () {
		itemIn= 0;
		$(".tos label").removeClass("active");
		$("input[type=checkbox]").prop('checked', false) ;
	    $("#regcancelbtn").prop("class","cancelbtn");
	    $("#divtos").css("display","none");
	})
		
});
// 비밀번호 찾기
$(document).ready(function(){
	$("#frmFind").submit(function(){
		if(!chkEmail($("#mEmail2").val())){
			alert("이메일형식에 맞게 입력하세요.");
			$("#divfind").css("display","block");
			$("#mEmail2").focus();
			return false;
		}
		$("#divfind").css("display","none");
		$("#divLogin").css("display","block");
	});
});


function chkEmail(mEmail)
{
 var reg_email =new RegExp(/^[a-zA-Z0-9]([-_\.]?[0-9a-zA-Z])*@[a-zA-Z]([-_\.]?[a-zA-Z])*\.[a-zA-Z]{2,3}$/i); 
 return reg_email.test(mEmail);
}


