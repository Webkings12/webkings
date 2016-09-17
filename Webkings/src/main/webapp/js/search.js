/**
 * 
 */
$(document).ready(function() {
	
	$.ajax({
		url:searchUrl,
		type:"GET", 
		data: "gender="+gender+"&searchVal="+searchVal,
		async:false,
		dataType:"json",
		success:function(res){
			searchSession = res.Searchsession;
			var itemSel = res.itemList;
			var shopList = res.shopList;
			itCount= res.itCount;
			shopCount= res.shopCount;
			searchList= res.searchList;
			var noResult="";
			var result="";
			if(shopList!=null && shopList!="" || itemSel!=null && itemSel!=""){
				if(shopList!=null && shopList!=""){
					result="<div class='tit-sec-1 tit-sec-full shop-search' style='display: block;'><div class='in'>"+
					"<strong>'<em>"+searchVal+"</em>' 샵 검색결과 <i>"+shopCount+"</i></strong>"+
					"<a href='javascript:;' class='more' style='display: inline;'>더보기</a>"+
					"</div></div>";
					result+="<ul class='item-list shop-search' style='display: block;'>";
				$.each(shopList, function(idx, item) {
					result+=
					"<li class='shop&nbsp"+gender+" ia' style='display: list-item;'><a href='javascript:;' seq='121'>"+	
					"<img src='"+item.sDomain+"'"+ 
					"data-original='http://img.sta1.kr/_up/shop/logo/2016/08/1472529181667_n1.jpg' class='item' style='display: block;'>"+
						"<div class='over'>		<div class='btn'><span class='shop'>"+
						"</span><i>샵 상세페이지</i><span class='fb sns'></span><i>페이스북 공유</i><span class='tw sns'></span><i>트위터 공유</i></div>"+
						"<p><i>316,800</i> 회 포털검색</p>		<div class='bg'></div>	</div>	<div class='info'>		<strong>"+item.sName+"</strong>"+
						"<span><i cate='201'>"+item.stName+"</i></span>		<em class=''>팔로우</em>	</div></a></li>";
				});
					result+="</ul>";
				}
				if(itemSel!=null && itemSel!=""){
				result+="<div class='tit-sec-1 tit-sec-full prod-search' style='display: block;'><div class='in'>"+
				"<div class='tit'>"+
				"<strong>'<em>"+searchVal+"</em>' 상품 검색결과 <i>"+itCount+"</i></strong>"+
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
					result+="<ul class='item-list abs-list prod-search' style='display: block;'>";
				$.each(itemSel, function(idx, item) {
					result+=
					"<li class='prod "+gender+"' style='left: 0px; top: 0px;'><a href='javascript:;' sseq='11' seq='1388374'>"+
					"<img src='"+item.sDomain+"' " +
					"data-original='http://img.sta1.kr/_up/prod/thmb/w/2016/09/17/03/1474048911831_AL.jpg' style='height: 310px; display: block;' " +
					"class='item'>	<span class='favor'>관심상품</span>"+
					"<div class='info'>		<span class='shop'>"+item.sName+"</span>" +
					"<span class='name'>"+item.iName+"</span>		<em class='cate' cate='104'>"+item.itName+"</em><i>"+item.iSalePrice+"</i>"+
					"<div class='btn'><span class='fb'>"+
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
			
			var searchS="";
			if(searchList!=null && searchList!=""){
				searchS+="<ul>";
				$.each(searchList, function(idx, item) {
					searchS+="<li><a href='javascript:;'>"+item+"</a></li>";
				});
				searchS+="</ul>";
			}else{
				alert("여기2");
				searchS="<ul class='noData'><li class='noData'>최근 검색어가 없습니다.</li></ul>";
			}
			searchS+="<p><a href='#' onclick='saveSearch()' class='save'>검색어 저장</a><a href='' class='del'>전체삭제</a>"+
									"</p>";
			$(".disnone").html(searchS);
			
			
		},error:function(xhr, status, error){
			alert(error);
		}
	});
	$("body>div.header div.search div.keyword .con>p a.del").click(function() {
		$.ajax({
			url:deleteUrl,
			success:function(res){
				alert(" 삭제성공");
			},error:function(xhr, status, error){
				alert(error);
			}
		});
		
	});
});
