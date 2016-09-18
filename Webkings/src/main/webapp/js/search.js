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
					result+="<div class='tit-sec-1 tit-sec-full shop-search' style='display: block;'><div class='in'>"+
					"<strong>'<em>"+searchVal+"</em>' 샵 검색결과 <i>"+shopCount+"</i></strong>"+
					"</div></div>";
					result+="<ul class='item-list shop-search' style='display: block;'>";
				$.each(shopList, function(idx, item) {
					result+=
					"<li class='shop "+gender+" ia' style='display: list-item;'><a href='http://"+item.sDomain+"'  target='_blank' seq='121'>"+	
					"<img src='"+item.sSimage+"'"+ 
					"data-original='http://img.sta1.kr/_up/shop/logo/2016/08/1472529181667_n1.jpg' class='item' style='display: block;'>"+
						"<div class='over'>		<div class='btn'>"+
						"<span class='fb sns'></span><i>페이스북 공유</i>" +
						"<span class='tw sns'>" +
						"<input type='hidden' id='itN' value='"+item.sName+"'/>"+
						"<input type='hidden' id='doma' value='"+item.sDomain+"'/>" +
						"</span>" +
						"<i>트위터 공유</i></div>"+
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
		"</div>"+
		"</div>";
					result+="<ul class='item-list abs-list prod-search' style='display: block;'>";
				$.each(itemSel, function(idx, item) {
					result+=
					"<li class='prod "+gender+"' style='left: 0px; top: 0px;'><a href='http://"+item.iDomain+"' target='_blank' sseq='11' seq='1388374'>"+
					"<img src='"+item.iImage+"' " +
					"data-original='http://img.sta1.kr/_up/prod/thmb/w/2016/09/17/03/1474048911831_AL.jpg' style='height: 310px; display: block;' " +
					"class='item'>	<span class='favor'>관심상품</span>"+
					"<div class='info'>		<span class='shop'>"+item.sName+"</span>" +
					"<span class='name'>"+item.iName+"</span>		<em class='cate' cate='104'>"+item.itName+"</em><i>"+item.iSalePrice+"</i>"+
					"<div class='btn'><span class='fb'>"+
					"</span><i>페이스북 공유</i>" +
					"<span class='tw'>" +
					"<input type='hidden' id='itN' value='"+item.iName+"'/>"+
					"<input type='hidden' id='doma' value='"+item.iDomain+"'/>" +
					"</span><i>트위터 공유</i></div>"+
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
			if(searchList!=null && searchList.length>0){
				searchS+="<ul>";
				$.each(searchList, function(idx, item) {
						searchS+="<li><a href='javascript:;'>"+item+"</a></li>";
				});
				searchS+="</ul>";
			}else{
				searchS="<ul class='noData'><li class='noData'>최근 검색어가 없습니다.</li></ul>";
			}
			searchS+="<p><a href='' class='del'>전체삭제</a>"+
									"</p>";
			$(".disnone").html(searchS);
		},error:function(xhr, status, error){
			alert(error);
		}
	});
	$("body>div.header div.search div.keyword .con>p a.del").click(function() {
		$.ajax({
			url:deleteUrl,
			async:false,
			success:function(res){
				
			},error:function(xhr, status, error){
				alert(error);
			}
		});
	});
	 $(".item-list>li.prod .info .btn .tw").click(function(e) {
			e.stopPropagation();
			e.preventDefault();
			var content = $(this).find("#itN").val();
			  var link = $(this).find("#doma").val();
			  var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
			  var wp = window.open("http://twitter.com/share?url=" + encodeURIComponent(link) + "&text=" + encodeURIComponent(content), 'twitter', popOption); 
			  if ( wp ) {
			    wp.focus();
			  }   
		});
	 
	 $(".item-list>li.shop .over .btn .tw.sns").click(function(e) {
			e.stopPropagation();
			e.preventDefault();
			var content = $(this).find("#itN").val();
			  var link = $(this).find("#doma").val();
			  var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
			  var wp = window.open("http://twitter.com/share?url=" + encodeURIComponent(link) + "&text=" + encodeURIComponent(content), 'twitter', popOption); 
			  if ( wp ) {
			    wp.focus();
			  }   
	});
});
