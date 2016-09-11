/**
 * 
 */
var gender ="";
var page = "";
$(document).ready(function() {
		$("body").attr("class","M");
		gender = $("body").attr("class");
		
		/*헤더 상단 카테고리 클릭시 페이지 연결자*/
		$(".gnb li").click(function() {
			page=$(".active #gnbPage").val();
			
			if(page=="/product" || page=="/item" || page=="/shop" || page=="/mypage"){
	 			$(location).attr('href', "/Webkings/page.do?page="+page+"&gender="+gender);
	 		}
		});
		
		/* 여자 아이콘 클릭시*/
		$(".gender.f").click(function(){
				gender="F";
				
				page=$(".active #gnbPage").val();
				
				if($(".list-top-1 p").hasClass("notice-2")){
					page="/product";
				}
				
				
			/* 연령대 구분값*/
				var age = $("#ageS").val();
			if(age=="10대 신상품"){
				age="10";
			}else if(age=="20대 신상품"){
				age="20";
			}else if(age=="30대 신상품"){
				age="30";
			}else{
				age="all";
			}
			
			if($("body").hasClass("M")){
				$("body").removeClass("M");
				$("body").attr("class","F");
				if(page=="/item"){
					if(age!=""){
						$(location).attr('href', "/Webkings/page.do?page="+page+"&gender=F&ageSel="+age);
					}else{
						$(location).attr('href', "/Webkings/page.do?page="+page+"&gender=F");
					}
					return;
				}
				
				if(page=="/product" ||  page=="/shop" || page=="/mypage"){
					$(location).attr('href', "/Webkings/page.do?page="+page+"&gender=F");
					return;
		 		}
				$(location).attr('href', "/Webkings/page.do?page="+page+"&gender=F");
			}
		});
});

