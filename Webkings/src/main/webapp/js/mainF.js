/**
 * 
 */
$(document).ready(function() {
/*	if(${li=="/item"} || ${li==null}){
			$(".gnb li:first-child").toggleClass("active");
		}else if(li=="/item"){
			$(".gnb li:nth-child(1)").toggleClass("active");
		}else if(li=="/shop"){
			$(".gnb li:nth-child(2)").toggleClass("active");
		}else if(li=="/info"){
			$(".gnb li:nth-child(3)").toggleClass("active");
		}else if(li=="/mypage"){
			$(".gnb li:nth-child(4)").toggleClass("active");
		}*/
		
		
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
			$(".gnb li").removeClass("active");
			$(this).toggleClass("active");
		})
		$(".gnb li").mouseleave(function() {
			$(this).removeClass("active");
			$(".gnb li:first-child").addClass("active");
		});
		
		var page = "";
		var cate ="";
		$(".gnb li").click(function() {
			$(".gnb li").removeClass("active");
			$(this).toggleClass("active");
			cate= $(".gnb li.active #gnbPage").val();
	 		page= cate+cate;
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