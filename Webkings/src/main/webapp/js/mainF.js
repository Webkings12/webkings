/**
 * 
 */
var gender ="";
var page = "";
$(document).ready(function() {
		
		$("body").attr("class","F");
		gender = $("body").attr("class");
		
		/*헤더 상단 카테고리 클릭시 페이지 연결자*/
		$(".gnb li").click(function() {
			page=$(".gnb li.active #gnbPage").val();
			
			if(page=="/item" || page=="/shop" || page=="/mypage"){
	 			$(location).attr('href', "/Webkings/page.do?page="+page+"&gender="+gender);
	 		}else if(page=="/product"){
	 			$(location).attr('href', "/Webkings/item/itemCate.do?page=/product&gender="+gender+"&cate="+itemCate+"&orderVal="+orderVal+"&sw2="+sw2+"&ssp="+ssp+"&sep="+sep+"&sac="+sac);
	 		}
		});
	/* 남자 아이콘 클릭시*/
	$(".gender.m").click(function() {
			gender="M";
			page=$(".active #gnbPage").val();
			
			if($(".list-top-1 p").hasClass("notice-2")){
				page="/product";
			}
				
			/* 연령대 구분값*/
			var age= $("#ageS").val();
			if(age=="10대 신상품"){
				age="10";
			}else if(age=="20대 신상품"){
				age="20";
			}else if(age=="30대 신상품"){
				age="30";
			}else{
				age="all";
			}
			
			if($("body").hasClass("F")){
				$("body").removeClass("F");
				$("body").attr("class","M");
				
				if(page=="/item"){
					if(age!=""){
						$(location).attr('href', "/Webkings/page.do?page="+page+"&gender=M&ageSel="+age);
					}else{
						$(location).attr('href', "/Webkings/page.do?page="+page+"&gender=M");
					}
					return;
				}
				if(page=="/shop" || page=="/mypage"){
		 			$(location).attr('href', "/Webkings/page.do?page="+page+"&gender=M");
		 			return;
		 		}else if(page=="/product"){
		 			$(location).attr('href', "/Webkings/item/itemCate.do?page=/product&gender="+gender+"&cate="+itemCate+"&orderVal="+orderVal+"&sw2="+sw2+"&ssp="+ssp+"&sep="+sep+"&sac="+sac);
		 		}else{
				$(location).attr('href', "/Webkings/page.do?page="+page+"&gender=M");
		 		}
			}
		});
});
