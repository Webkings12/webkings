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
$(document).ready(function() {
	$.ajax({
		url:searchUrl,
		type:"GET", 
		data: "gender="+gender+"&searchVal="+searchVal,
		async:false,
		dataType:"json",
		success:function(res){
			var itemSel = res.itemList;
			var shopList = res.shopList;
			itCount= res.itCount;
			shopCount= res.shopCount;
			searchList= res.searchList;
			var result="<div class='tit-sec-1 tit-sec-full shop-search' style='display: block;'><div class='in'>"+
							"<strong>'<em>s</em>' 샵 검색결과 <i>294</i></strong>"+
							"<a href='javascript:;' class='more' style='display: inline;'>더보기</a>"+
							"</div></div>";
			var noResult="";
			if(shopList!=null && itemSel!=null){
				if(shopList!=null){
					result+="<ul class='item-list shop-search' style='display: block;'>";
				$.each(shopList, function(idx, item) {
					result+=
						
					"<li class='shop  "+gender+" ia' style='display: list-item;'><a href='javascript:;' seq='121'>"+	
					"<img src='http://img.sta1.kr/_up/shop/logo/2016/08/1472529181667_n1.jpg"+ 
					"data-original='http://img.sta1.kr/_up/shop/logo/2016/08/1472529181667_n1.jpg' class='item' style='display: block;'>"+
						"<div class='over'>		<div class='btn'><span class='shop'>"+
						"</span><i>샵 상세페이지</i><span class='fb sns'></span><i>페이스북 공유</i><span class='tw sns'></span><i>트위터 공유</i></div>"+
						"<p><i>316,800</i> 회 포털검색</p>		<div class='bg'></div>	</div>	<div class='info'>		<strong>갠소</strong>"+
						"<span><i cate='201'>러블리</i>, <i cate='215'>심플베이직</i></span>		<em class=''>팔로우</em>	</div></a></li>";
				});
					result+="</ul>";
				}
				result+="<div class='tit-sec-1 tit-sec-full prod-search' style='display: block;'><div class='in'>"+
				"<div class='tit'>"+
				"<strong>'<em>s</em>' 상품 검색결과 <i>6,000</i></strong>"+
			"</div>"+
			"<div class='option-sec-1'>"+
				"<ul>"+
					"<li class='order'>"+
						"<a href='javascript:;' class='aw-1'>신상품순</a>"+
						"<ul>"+
							"<li><a href='javascript:;' val='0'>신상품순</a></li>"+
							"<li><a href='javascript:;' val='2'>클릭순</a></li>"+
							"<li><a href='javascript:;' val='3'>낮은 가격순</a></li>"+
							"<li><a href='javascript:;' val='4'>높은 가격순</a></li>"+
						"</ul>"+
					"</li>"+

					"<li class='detail-search'>"+
						"<a href='javascript:;' class='search-1'>상세검색</a>"+
						"<div class='sec'><div class='in'>"+
						"<form id='_frmDetailSearch'>"+
							"<p><input type='text' name='sw2' value='' fieldname='검색어' placeholder='결과내 재검색' checkfunctionname='checkSpecialChar' restrictutf8bytes='45'" +
							"confirmmessage='특수문자로 검색하실수 없습니다.' autocomplete='off' focus='off'></p>"+
							"<div>"+
								"<label>가격대</label>"+
								"<input type='text' name='ssp' value=''> ~ <input type='text' name='sep' value=''>"+
							"</div>"+
							"<div>"+
								"<label>연령대</label>"+
								"<ul>"+
									"<li><input type='radio' name='sac' value='1' id='age1'><label for='age1'>10대</label></li>"+
									"<li><input type='radio' name='sac' value='2' id='age2'><label for='age2'>20대</label></li>"+
									"<li><input type='radio' name='sac' value='3' id='age3'><label for='age3'>30대</label></li>"+
								"</ul>"+
							"</div>"+
							"<div class='btn'>"+
								"<input type='submit' value='선택항목으로 검색'>"+
								"<a href='javascript:;' class='reset'>초기화</a>"+
							"</div>"+
						"</form>"+
						"</div></div>"+
					"</li>"+
				"</ul>"+
			"</div>"+
		"</div>"+
		"</div>";
				if(itemSel!=null){
					result+="<ul class='item-list abs-list prod-search' style='display: block;'>";
				$.each(shopList, function(idx, item) {
					result+=
					"<li class='prod"+gender+"' style='left: 0px; top: 0px;'><a href='javascript:;' sseq='11' seq='1388374'>"+
					"<img src='http://img.sta1.kr/_up/prod/thmb/w/2016/09/17/03/1474048911831_AL.jpg' " +
					"data-original='http://img.sta1.kr/_up/prod/thmb/w/2016/09/17/03/1474048911831_AL.jpg' style='height: 310px; display: block;' " +
					"class='item'>	<span class='favor'>관심상품</span>"+
					"<div class='info'>		<span class='shop'>스타일난다</span>" +
					"<span class='name'>오프숄더 FLARE MINI OPS_IV</span>		<em class='cate' cate='104'>ONE PIECE</em><i>67,800</i>"+
					"<div class='btn'><span class='fb'>"
					"</span><i>페이스북 공유</i><span class='tw'></span><i>트위터 공유</i></div>"+
					"</div>	<div class='bg'></div></a></li>";
				});
				result+="</ul>";
				$("div.body-sec>div.in-sec>div.not-top").html(result);
				}
			}else{
				noResult+="<div class='not-item'>검색 결과가 없습니다.</div></div></div>";
				$("div.body-sec>div.in-sec>div.not-top").html(noResult);
			}
		},error:function(xhr, status, error){
			alert(error);
		}
	});
});