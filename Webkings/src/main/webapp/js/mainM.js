/**
 * 
 */
var gender ="";
var page = "";
$(document).ready(function() {
		$("body").attr("class","M");
		gender = $("body").attr("class");
		
		$(".gnb li").click(function() {
			page=$(".active #gnbPage").val();
			
			if(page=="/product" || page=="/item" || page=="/shop" || page=="/mypage"){
	 			$(location).attr('href', "/Webkings/page.do?page="+page+"&gender="+gender);
	 		}
		});
		
			$(".gender.f").click(function(){
				gender="F";
				
				page=$(".active #gnbPage").val();
				
				if($(".list-top-1 p").hasClass("notice-2")){
					page="/product";
				}
			
			if($("body").hasClass("M")){
				$("body").removeClass("M");
				$("body").attr("class","F");
				
				if(page=="/product" || page=="/item" || page=="/shop" || page=="/mypage"){
		 			$(location).attr('href', "/Webkings/page.do?page="+page+"&gender=F");
		 		}
				$(location).attr('href', "/Webkings/page.do?page="+page+"&gender=F");
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