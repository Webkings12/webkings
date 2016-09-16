/**
 * 
 */
$(document).ready(function() {
	var iNo="";
			 $.ajax({
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
							"<a id='a123' href='"+item.sDomain+"' sseq='121' seq='1349867' maindate='20160908'>"+
								"<img src='../../itemImage/"+item.iImage+"' data-original='http://img.sta1.kr/_up/prod/main/2016/09/08/1473208334629_w.jpg'"+
								"style='height: 340px; display: block;' class='item'>"+
								"<span class='favor' id='myitem'>관심상품</span>"+
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
					result+="<li class='date'  id='date2'>"+
									"<div class='sec today'>"+
									"<span>ALLDAY</span><strong></strong><em></em>개의 상품 추천"+
									"</div>"+
									"</li>";
					$.each(itemSel, function(idx, item) {
						iNo=item.iNo;
						result+=
						"<li class='prod "+item.itGender+" ia' id='prod2'>"+
							"<a href='"+item.sDomain+"' sseq='121' seq='1349867' maindate='20160908'>"+
								"<img src='../../itemImage/"+item.iImage+"' data-original='http://img.sta1.kr/_up/prod/main/2016/09/08/1473208334629_w.jpg'"+
								"style='height: 340px; display: block;' class='item'>"+
								"<span class='favor' id='favor'>관심상품</span>"+
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
					$(".item-list").html(result);
					
				},
				error:function(xhr, status, error){
					alert(error);
				}
				
			});
					 
			 /*날짜구하기*/
			 var today = new Date();
			 var year= today.getFullYear();
		     var mon = (today.getMonth()+1)>9 ? ''+(today.getMonth()+1) : '0'+(today.getMonth()+1);
		     var day = today.getDate()>9 ? ''+today.getDate() : '0'+today.getDate();
		              
		     var dayVal = mon + '.' + day;
		     $(".item-list>li#date1 .sec.today strong").append(dayVal);
		     
		     $(".item-list li#date1 em").append(itNCount);
		     if(itemAge!="" && itemAge!="all"){
		    	 $(".item-list li#date2 strong").append(itemAge+"대상품");
		     }else{
		    	 $(".item-list li#date2 strong").append("전체상품");
		     }
		     $(".item-list li#date2 em").append(itOCount);
		     
		     // 클릭 이벤트
		     $(".item-list>li.prod .favor").click(function () {
		    	 $.ajax({
			 			url:"/Webkings/myitem.do",
			 			type:"GET",
			 			data:"iNo="+iNo, //요청 파라미터
			 			dataType:"text",
			 			success:function(res){
			 				 $("#a123").click(function () {
			 					 return false;
			 				 });
			 			},
			 			error:function(xhr, status, error){
			 			}
			 		});
			});
		     
		});
function gbn(){
	if($(".list-top-1 p").hasClass("notice-1")){
		page="/product";
		$(location).attr('href', "/Webkings/item/itemCate.do?page="+page+"&gender="+gender);
		
	}else if($(".list-top-1 p").hasClass("notice-2")){
		page="/item";
		$(location).attr('href', "/Webkings/page.do?page="+page+"&gender="+gender);
	}
}
