/**
 * 
 */
$(document).ready(function() {
		$("body").attr("class","F");
		var gender = $("body").attr("class");
		/*var page="";
		if(session.getAttribute("gender")!=null){
			gender=session.getAttribute("gender");
		}else{
			gender="F";
		}
		*/
		$(".gnb li").mouseenter(function() {
			$(".gnb li:first-child").removeClass("active");
			$(this).addClass("active");
		})
		$(".gnb li").mouseleave(function() {
			$(this).removeClass("active");
			$(".gnb li:first-child").addClass("active");
		});
		
		var page = "";
		var cate ="";
		$(".gnb li").click(function() {
			cate= $(".gnb li.active #gnbPage").val();
			alert(cate);
	 		page= cate+cate;
	 		if($(".gnb li").hasClass("active")){
				$(this).removeClass("active");
			}
			$(this).addClass("active");
	 		if(cate=="/product" || cate=="/shop"){
	 			page+=gender;
	 		}
	 		$(location).attr('href', "/Webkings/page.do?page="+page);
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
}); 