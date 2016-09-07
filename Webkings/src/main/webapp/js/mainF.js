/**
 * 
 */
var gender ="";
var page = "";
$(document).ready(function() {
		
		$("body").attr("class","F");
		gender = $("body").attr("class");
		
		
		$(".gnb li").click(function() {
			page=$(".gnb li.active #gnbPage").val();
			
			if(page=="/product" || page=="/item" || page=="/shop" || page=="/mypage"){
	 			$(location).attr('href', "/Webkings/page.do?page="+page+"&gender="+gender);
	 		}
		});
		
	$(".gender.m").click(function() {
			gender="M";
			page=$(".gnb li.active #gnbPage").val();
			
			if($(".list-top-1 p").hasClass("notice-2")){
				page="/product";
			}
			
			if($("body").hasClass("F")){
				$("body").removeClass("F");
				$("body").attr("class","M");
				
				if(page=="/product" || page=="/item" || page=="/shop" || page=="/mypage"){
		 			$(location).attr('href', "/Webkings/page.do?page="+page+"&gender=M");
		 		}
				
				$(location).attr('href', "/Webkings/page.do?page="+page+"&gender=M");
			}
		});
});
function gbn() {
	if($(".list-top-1 p").hasClass("notice-1")){
		page="/product";
		$(location).attr('href', "/Webkings/page.do?page="+page+"&gender="+gender);
	}else if($(".list-top-1 p").hasClass("notice-2")){
		page="/item";
		$(location).attr('href', "/Webkings/page.do?page="+page+"&gender="+gender);
	}
}