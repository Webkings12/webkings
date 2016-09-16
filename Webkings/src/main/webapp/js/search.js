/**
 * 
 */
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
function allSearch(){
	searchName = $("body>div.header div.search form>p input[type=text]").val();
	$(location).attr('href', "/Webkings/shop/shopView.do?gender="+gender+"&style="+style+"&searchName="+searchName);
}
