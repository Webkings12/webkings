/**
 * 
 */
var gender ="";
var page = "";
/*검색어 저장*/
function saveSearch() {
	if($("body>div.header div.search div.keyword .con>p a.save").hasClass("save")){
		if($("body>div.header div.search div.keyword .con>p a.save.active").hasClass("save active")){
			$("body>div.header div.search div.keyword .con>p a.save").attr("class","save");
		}else{
		$("body>div.header div.search div.keyword .con>p a.save").attr("class","save active");
		}
	}
}	
$(document).ready(function() {
		$("body").attr("class","M");
		gender = $("body").attr("class");
		
		/*헤더 상단 카테고리 클릭시 페이지 연결자*/
		$(".gnb li").click(function() {
			page=$(".active #gnbPage").val();
			
			if(page=="/item" || page=="/shop" || page=="/mypage"){
	 			$(location).attr('href', "/Webkings/page.do?page="+page+"&gender="+gender);
	 		}else if(page=="/product"){
	 			$(location).attr('href', "/Webkings/item/itemCate.do?page=/product&gender="+gender+"&cate="+itemCate+"&orderVal="+orderVal+"&sw2="+sw2+"&ssp="+ssp+"&sep="+sep+"&sac="+sac);
	 		}else if(page=="/info"){
	 			$(location).attr('href', "/Webkings/freeboard/list.do?gender="+gender);
	 		}
		});
		
		/* 여자 아이콘 클릭시*/
		$(".gender.f").click(function(){
				gender="F";
				
				page=$(".active #gnbPage").val();
				
				if(page==null || page==""){
					page="/search";
				}
				alert(page);
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
				if(page=="/shop" || page=="/mypage"){
		 			$(location).attr('href', "/Webkings/page.do?page="+page+"&gender=F");
		 			return;
		 		}else if(page=="/product"){
		 			$(location).attr('href', "/Webkings/item/itemCate.do?page=/product&gender="+gender+"&cate="+itemCate+"&orderVal="+orderVal+"&sw2="+sw2+"&ssp="+ssp+"&sep="+sep+"&sac="+sac);
		 		}else{
				$(location).attr('href', "/Webkings/page.do?page="+page+"&gender="+gender);
		 		}
			}
		});
});

