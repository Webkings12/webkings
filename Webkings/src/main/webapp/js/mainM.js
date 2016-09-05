/**
 * 
 */
$(document).ready(function() {
		$("body").attr("class","M");
		var gender = $("body").attr("class");
		/*var page="";
		if(session.getAttribute("gender")!=null){
			gender=session.getAttribute("gender");
		}else{
			gender="F";
		}
		*/
		
		var page = "";
		var cate = "";
		/*alert(page);*/
		$(".gnb li").click(function() {
			cate = $(".active #gnbPage").val();
	 		page= cate+cate;
	 		if(cate=="/product" || cate=="/shop"){
	 			page+=gender;
	 		}
	 		
		$(".gnb li").mouseenter(function() {
			$(".gnb li:first-child").removeClass("active");
			$(this).addClass("active");
		})
		$(".gnb li").mouseleave(function() {
			$(this).removeClass("active");
			$(".gnb li:first-child").addClass("active");
		});
		
		$(".gender.m").click(function() {
			gender="M";
			page="/product/productM";
			if($("body").hasClass("F")){
				$("body").removeClass("F");
				$("body").attr("class","M");
				$(location).attr('href', "/Webkings/page.do?page="+page);
			}
		});
			$(".gender.f").click(function(){
				gender="F";
				page="/product/productF";
			if($("body").hasClass("M")){
				$("body").removeClass("M");
				$("body").attr("class","F");
				$(location).attr('href', "/Webkings/page.do?page="+page);
			}
		});
			
/* 		alert(page);*/
 		$(location).attr('href', "/Webkings/page.do?page="+page);
	});
	
}); 