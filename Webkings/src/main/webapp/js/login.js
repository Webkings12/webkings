/**
 * 
 */
// 로그인
$(document).ready(function(){
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
            $('#UploadedImg').css({"width":"80px"},{"height":"80px"});
            $('#UploadedImg').css("border-radius","40px");
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
		}
		
		$("#divreg").css("display","none");
		
	});
	$("#aCertify").click(function() {
		if(($("#mEmail").val().length<1)){
			alert("이메일을 입력하세요.");
			$("#divreg").css("display","block");
			$("#mEmail").focus();
			return false
		}
	
	});
	
	
	
});

//이용약관

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


