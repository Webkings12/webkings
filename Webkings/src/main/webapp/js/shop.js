/**
 * 
 */
$(document).ready(function() { 
			 $.ajax({
				url:url,
				type:"GET",
				data: "gender="+gender+"&style="+style+"&searchName="+searchName,
				async:false,
				dataType:"json",
				success:function(res){
					styleSel = res.shopList;
					var result="";
					sNewList =res.shopNewList;
					if(sNewList!=null){
					$.each(sNewList, function(idx, item) {
					 result+=
					"<li class='shop sec-2  F ia'>"+
					"<a href='http://"+item.sDomain+"'  target='_blank' seq='121'>"+	
					"<img src='"+item.sBimage+"' data-original='http://img.sta1.kr/_up/shop/logo/2016/09/1473406293970_a1.jpg' class='item'" +
					" style='display: block;'>"+
					"<div class='over'>		<div class='btn'>" +
					"<span class='fb sns'>" +
					"</span><i>페이스북 공유</i><span class='tw sns'></span><i>트위터 공유</i></div>"	+
							"<p><i></i> 회 포털검색</p>		<div class='bg'></div>	</div>	<div class='info'>"	+
							"<strong>"+item.sName+"</strong><span><i cate='201'>"+item.stName+"</i></span>"	+	
							"<em class=''>팔로우</em>"+
							"</div></a></li>";
					});
					}
					if(styleSel!=null){
						$.each(styleSel, function(idx, item) {
							result+=
						"<li class='shop  F ia'><a href='http://"+item.sDomain+"'  target='_blank' seq='271'>"	+
						"<img src='"+item.sSimage+"' " +
						"data-original='http://img.sta1.kr/_up/shop/logo/2016/08/1471857259160_n1.jpg' class='item' style='display: block;'>"+
						"<div class='over'>		<div class='btn'><span class='fb sns'>" +
						"</span><i>페이스북 공유</i><span class='tw sns'></span><i>트위터 공유</i></div>"+
						"<p><i></i> 회 포털검색</p>		<div class='bg'></div>	</div>	<div class='info'>"	+
						"<strong><i>"+(idx+1)+"위</i>"+item.sName+"</strong>	<span><i cate='206'>"+item.stName+"</i></span>	<em class=''>팔로우</em>	</div>"+
						"</a></li>";
						});
					}
					$(".item-list").html(result);
				},
				error:function(xhr, status, error){
					alert(error);
				}
			}); 
			 $(".option-sec-2 input[type=text]").val(searchName);
			 if($(".option-sec-2 input[type=text]").val()!=""){
				 $(".option-sec-2 input[type=text]").focus();
			 }
});
function enterSearch(){
	searchName = $(".option-sec-2 input[type=text]").val();
	$(location).attr('href', "/Webkings/shop/shopView.do?gender="+gender+"&style="+style+"&searchName="+searchName);
}