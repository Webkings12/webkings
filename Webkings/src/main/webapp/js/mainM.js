/**
 * 
 */
var gender ="";
var page = "";
$(document).ready(function() {
		$("body").attr("class","M");
		gender = $("body").attr("class");
		var cate =  "";
		
		$(".gnb li").click(function() {
			cate=$(".active #gnbPage").val();
			page=cate+cate;
	 		if(cate=="/item" || cate=="/shop" || cate=="/mypage"){
	 			page+=gender;
	 		}
	 		$(location).attr('href', "/Webkings/page.do?page="+page);
		});
		
			$(".gender.f").click(function(){
				gender="F";
				
				cate=$(".active #gnbPage").val();
				page=cate+cate;
				
				if($(".list-top-1 p").hasClass("notice-2")){
					cate="/product";
					page=cate+cate;
				}
				
		 		if(cate=="/product" || cate=="/item" || cate=="/shop" || cate=="/mypage"){
		 			page+=gender;
		 		}
			if($("body").hasClass("M")){
				$("body").removeClass("M");
				$("body").attr("class","F");
				$(location).attr('href', "/Webkings/page.do?page="+page);
			}
		});
});
function gbn() {
	if($(".list-top-1 p").hasClass("notice-1")){
		page="/product/product"+gender;
		$(location).attr('href', "/Webkings/page.do?page="+page);
	}else if($(".list-top-1 p").hasClass("notice-2")){
		page="/item/item"+gender;
		$(location).attr('href', "/Webkings/page.do?page="+page);
	}
}