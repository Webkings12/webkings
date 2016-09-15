/**
 * 
 */
$(document).ready(function() { 
	alert(url);
	 $(".option-sec-2 input[type=text]").keydown(function (key) {
		 	if(key.keyCode == 13){  //키가 13이면 실행 (엔터는 13)
		 		searchName = $(this).val();
		 		$(location).attr('href', "/Webkings/shop/shopStyle.do?gender="+gender+"&style="+style+"&searchName="+searchName);
	        }
	}); 
	alert(searchName);
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
					"<a href='javascript:;' seq='121'>"+	
					"<img src='http://img.sta1.kr/_up/shop/logo/2016/09/1473406293970_a1.jpg' data-original='http://img.sta1.kr/_up/shop/logo/2016/09/1473406293970_a1.jpg' class='item'" +
					" style='display: block;'>"+
					"<div class='over'>		<div class='btn'>" +
					"<span class='shop'></span><i>샵 상세페이지</i><span class='fb sns'>" +
					"</span><i>페이스북 공유</i><span class='tw sns'></span><i>트위터 공유</i></div>"	+
							"<p><i>316,800</i> 회 포털검색</p>		<div class='bg'></div>	</div>	<div class='info'>"	+
							"<strong>갠소</strong>		<span><i cate='201'>러블리</i>, <i cate='215'>심플베이직</i></span>"	+	
							"<em class=''>팔로우</em>"+
							"</div></a></li>";
					});
					}
					if(styleSel!=null){
						$.each(styleSel, function(idx, item) {
							result+=
						"<li class='shop  F ia'><a href='javascript:;' seq='271'>"	+
						"<img src='http://img.sta1.kr/_up/shop/logo/2016/08/1471857259160_n1.jpg' " +
						"data-original='http://img.sta1.kr/_up/shop/logo/2016/08/1471857259160_n1.jpg' class='item' style='display: block;'>"+
						"<div class='over'>		<div class='btn'><span class='shop'></span><i>샵 상세페이지</i><span class='fb sns'>" +
						"</span><i>페이스북 공유</i><span class='tw sns'></span><i>트위터 공유</i></div>"+
						"<p><i>1,183,000</i> 회 포털검색</p>		<div class='bg'></div>	</div>	<div class='info'>"	+
						"<strong><i>1위</i>육육걸즈</strong>	<span><i cate='206'>십대쇼핑몰</i></span>	<em class=''>팔로우</em>	</div>"+
						"</a></li>";
						});
					}
					$(".item-list").html(result);
				},
				error:function(xhr, status, error){
					alert(error);
				}
			}); 
			
});