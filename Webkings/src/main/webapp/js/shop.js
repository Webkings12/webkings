/**
 * 
 */
	/* $.ajax({
				url:url,
				type:"GET",
				data: "gender="+gender+"&age="+itemAge+"&itNCount="+itNCount+"&itOCount="+itOCount,
				async:false,
				dataType:"json",
				success:function(res){
				itemSel = res.itemList;
				nItemSel = res.nItemList;
					var result =
					"<li class='plan-sec'>"+
						"<div class='list'>"+
							"<ul>"+
								"<li>"+
									"<a href='/exhibition/62'><img src='http://img.sta1.kr/_up/exhib/2016/08/1472187676462_wm.png' class='item'></a>"+
								"</li>"+
								"<li>"+
									"<a href='/exhibition/65'><img src='http://img.sta1.kr/_up/exhib/2016/08/1472635035374_wm.png' class='item'></a>"+
								"</li>"+
								"<li>"+
									"<a href='/exhibition/57'><img src='http://img.sta1.kr/_up/exhib/2016/08/1472031294631_wm.png' class='item'></a>"+
								"</li>"+
								"<li>"+
									"<a href='/exhibition/63'><img src='http://img.sta1.kr/_up/exhib/2016/08/1472548791421_wm.png' class='item'></a>"+
								"</li>"+
								"<li>"+
									"<a href='/exhibition/60'><img src='http://img.sta1.kr/_up/exhib/2016/08/1472054776607_wm.png' class='item'></a>"+
								"</li>"+
							"</ul>"+
						"</div>"+
						"<a href='#exhibition' class='total'>전체보기</a>"+
						"<div class='paging'><span class='active'>1</span><span>2</span><span>3</span><span>4</span><span>5</span></div>"+
					"</li>";
					
					result +="<li class='bnr-1'>"+
						"<a href='https://play.google.com/store/apps/details?id=com.sta1.front&amp;hl=ko' target='_blank'>"+
						"<img src='http://img.sta1.info/rsc/front/img/bnr-1.png' class='item'></a>"+
					"</li>";
					
					result +="<li class='date' id='date1'>"+
									"<div class='sec today'>"+
									"<span>TODAY</span><strong></strong><em></em>개의 신상품 추천"+
									"</div>"+
									"</li>";
					
					if(nItemSel!=null){
						
						$.each(nItemSel, function(idx, item) {
							result+=
							"<li class='prod "+item.itGender+" ia' id='prod1'>"+
							"<a href='"+item.sDomain+"' sseq='121' seq='1349867' maindate='20160908'>"+
								"<img src='../../itemImage/"+item.iImage+"' data-original='http://img.sta1.kr/_up/prod/main/2016/09/08/1473208334629_w.jpg'"+
								"style='height: 340px; display: block;' class='item'>"+
								"<span class='favor'>관심상품</span>"+
								"<div class='info'>	<span class='shop'>"+item.sName+"</span>"+		
									"<span class='name'>"+item.iName+"</span>	<em class='cate' cate='101'>"+item.itName+"</em><i>"+
									item.iSalePrice+"</i>"+		
									"<div class='btn'>"+
										"<span class='fb'></span><i>페이스북 공유</i><span class='tw'></span><i>트위터 공유</i>"+
									"</div>"+	
								"</div>"+	
								"<div class='bg'></div>"+
							"</a>"+
							"</li>";
							});
						}
					$(".item-list").html(result);
				},
				error:function(xhr, status, error){
					alert(error);
				}*/