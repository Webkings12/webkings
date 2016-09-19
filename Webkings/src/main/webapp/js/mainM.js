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
				}
				else if(page=="/shop"){
		 			$(location).attr('href', "/Webkings/page.do?page="+page+"&gender=F");
		 		}else if(page=="/product"){
		 			$(location).attr('href', "/Webkings/item/itemCate.do?page=/product&gender="+gender+"&cate="+itemCate+"&orderVal="+orderVal+"&sw2="+sw2+"&ssp="+ssp+"&sep="+sep+"&sac="+sac);
		 		}else if(page=="/search"){
		 			$(location).attr('href', "/Webkings/search/view.do?searchVal="+searchVal+"&gender="+gender);
		 		}else if(page=="/info"){
		 			$(location).attr('href', "/Webkings/freeboard/list.do?gender="+gender);
		 		}
		 		else if(page=="/mypage"){
		 			if($(".body-sec .in-sec #myPageVal").val()==null){
						$(location).attr('href', "/Webkings/page.do?page="+page+"&gender="+gender);
		 			}
		 			else if($(".body-sec .in-sec #myPageVal").val()=="service"){
		 				$(location).attr('href', "/Webkings/service.do?gender="+gender);
		 			}else if($(".body-sec .in-sec #myPageVal").val()=="company"){
		 				$(location).attr('href', "/Webkings/company.do?gender="+gender);
		 			}else if($(".body-sec .in-sec #myPageVal").val()=="myitemList"){
		 				$(location).attr('href', "/Webkings/myitemList.do?gender="+gender);
		 			}else if($(".body-sec .in-sec #myPageVal").val()=="prodList"){
		 				$(location).attr('href', "/Webkings/prodList.do?gender="+gender);
		 			}
		 			else if($(".body-sec .in-sec #myPageVal").val()=="latelyShopList"){
		 				$(location).attr('href', "/Webkings/shop/latelyShopList.do?gender="+gender);
		 			}
		 		}
			}
		});
});

