/**
 * 
 */
$(document).ready(function() {
	
	var loginCheck="";
	$("#formLogin").submit(function(event){
		if($("#mEmail1").val().length<1){
			alert("관리자 아이디를 입력하세요.");
			$("#divLogin").css("display","block");
			$("#mEmail1").focus();
			return false;
		}else if($("#mPwd1").val().length<1){
			alert("관리자 비밀번호를 입력하세요.");
			$("#mPwd1").focus();
			return false;
		}else{			
			$.ajax({
				url:loginURL,
				type:"POST",
				async:false,
				data:$(this).serialize(), //요청 파라미터
				dataType:"json",
				success:function(res){
					alert(res);
					if(res==1){
					}else if (res==2) {
						alert("비밀번호가 다릅니다");
					}else if (res==3){
						alert("해당 아이디가 존재하지 않습니다");
					}
					loginCheck=res;
				},
				error:function(xhr, status, error){
					alert(error);
				}
			});
		}
		if(loginCheck=="1"){
			alert("두번째"+loginCheck);
			$(".modal2").css("display","none");
		}else{
			alert("로그인 실패");
			return false;
		}
	});
	
	$(".amodel .adF").click(function() {
		alert("선택여자");
	});
	$(".amodel .adM").click(function() {
		alert("선택남자");
	});
});