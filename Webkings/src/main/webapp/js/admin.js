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
			/*$(".modal2").css("display","none");*/
		}else{
			return false;
		}
	});
	
	//관리자 아이템 성별 선택자
	$("#ItemGenderSel .amodel div span").click(function() {
		gender=$(this).find("input[type='hidden']").val();
		$(location).attr('href', "/Webkings/adminItemView.do?gender="+gender);
	});
	
	//관리자 샵 성별 선택자
	$("#ShopGenderSel .amodel div span").click(function() {
		gender=$(this).find("input[type='hidden']").val();
		$(location).attr('href', "/Webkings/adminShopView.do?gender="+gender);
	});
});