/**
 * 
 */
$(document).ready(function() {
	var iNo="";
	var sNo="";
	var itemDo="";
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
					"<li class='bnr-1'>"+
						"<a href='http://naver.com' target='_blank'>"+
						"<img src='' class='item'></a>"+
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
							"<a id='a123' href='http://"+item.iDomain+"'  target='_blank' sseq='121' seq='1349867' maindate='20160908'>"+
								"<img src='../../itemImage/"+item.iImage+"' data-original='http://img.sta1.kr/_up/prod/main/2016/09/08/1473208334629_w.jpg'"+
								"style='height: 340px; display: block;' class='item'>"+
								"<span class='favor' id='myitem'>관심상품</span>"+
								"<div class='info'>	<span class='shop'>"+item.sName+"</span>"+		
									"<span class='name'>"+item.iName+"</span>	<em class='cate' cate='101'>"+item.itName+"</em>";
									if(item.iSalePrice!=null){
										result+="<i><s>"+item.iPrice+"</s>"+item.iSalePrice+"</i>";
									}else{
										result+="<i>"+item.iPrice+"</i>";
									}
									result+="<div class='btn'>"+
										"<span class='fb'>" +
										"<input type='hidden' id='fbTitle' value='"+item.iName+"'/>"+
										"<input type='hidden' id='fbUrl' value='"+item.iDomain+"'/>" +
										"<input type='hidden' id='fbImage' value='"+item.iImage+"'/>" +
										"<input type='hidden' id='fbContent' value='"+item.itName+"'/>" +
										"</span>" +
										"<i>페이스북 공유</i>" +
										"<span class='tw'>" +
										"<input type='hidden' id='doma' value='"+item.iDomain+"'/>" +
										"<input type='hidden' id='itN' value='"+item.iName+"'/>"+
										"</span>"+
										"<i>트위터 공유</i>"+
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
						result+=
						"<li class='prod "+item.itGender+" ia' id='prod2'>"+
							"<a id='aaa' href='http://"+item.iDomain+"' target='_blank' sseq='121' seq='1349867' maindate='20160908'>"+
								"<input type='hidden' id='inputiNo1' name='iINo' value='"+item.iNo+"'>"+
								"<img src='../../itemImage/"+item.iImage+"' data-original='http://img.sta1.kr/_up/prod/main/2016/09/08/1473208334629_w.jpg'"+
								"style='height: 340px; display: block;' class='item'>"+
								"<span class='favor'>관심상품<input type='hidden' id='inputiNo' name='iINo' value='"+item.iNo+"'>" +
										"<input type='hidden' id='inputsNo' name='iSNo' value='"+item.sNo+"'></span>"+
								"<div class='info'>	<span class='shop'>"+item.sName+"</span>"+		
									"<span class='name'>"+item.iName+"</span>	<em class='cate' cate='101'>"+item.itName+"</em>";
									if(item.iSalePrice!=null){
										result+="<i><s>"+item.iPrice+"</s>"+item.iSalePrice+"</i>";
									}else{
										result+="<i>"+item.iPrice+"</i>";
									}
									result +=
									"<div class='btn'>"+
										"<span class='fb' >" +
										"<input type='hidden' id='fbTitle' value='"+item.iName+"'/>"+
										"<input type='hidden' id='fbUrl' value='"+item.iDomain+"'/>" +
										"<input type='hidden' id='fbImage' value='"+item.iImage+"'/>" +
										"<input type='hidden' id='fbContent' value='"+item.itName+"'/>" +
										"</span>" +
										"<i>페이스북 공유</i>" +
										"<span class='tw'>" +
											"<input type='hidden' id='itN' value='"+item.iName+"'/>"+
											"<input type='hidden' id='doma' value='"+item.iDomain+"'/>" +
										"</span>" +
												"<i>트위터 공유</i>"+
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
			/* 아이템 클릭 업데이트
			 $(".item-list>li.prod>a").click(function() {
				iNo = $(this).find("#inputiNo").val();
				 $.ajax({
					 url:itemUpdateUrl,
					 type:"GET", 
					 data: "iNo="+iNo,
					 async:false,
					 dataType:"json",
					 success:function(res){
					 },error:function(xhr, status, error){
							alert(error);
					}
					 
				 });
			});*/
			 
			/*트위터*/
			 $(".item-list>li#prod2 .info .btn .tw").click(function(e) {
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
			 
			 $(".item-list>li#prod1 .info .btn .tw").click(function(e) {
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
			 /*페이스북*/
			 $(".item-list>li#prod1 .info .btn .fb").click(function(e) {
					e.stopPropagation();
					e.preventDefault();
					
					fbTitle=$(this).find("#fbTitle").val();
					fbUrl= $(this).find("#fbUrl").val();
					fbImage= $(this).find("#fbImage").val();
					fbContent=$(this).find("#fbContent").val();
					
					
				  var popOption = "width=600, height=400, resizable=no, scrollbars=no, status=no;";
				  window.open("http://www.facebook.com/sharer/sharer.php?u="+fbUrl, "share",popOption); 
			});
			 
			 $(".item-list>li#prod2 .info .btn .fb").click(function(e) {
					e.stopPropagation();
					e.preventDefault();
					
					fbTitle=$(this).find("#fbTitle").val();
					fbUrl= $(this).find("#fbUrl").val();
					fbImage= $(this).find("#fbImage").val();
					fbContent=$(this).find("#fbContent").val();
					
					
				  var popOption = "width=600, height=400, resizable=no, scrollbars=no, status=no;";
				  window.open("http://www.facebook.com/sharer/sharer.php?u="+fbUrl, "share",popOption); 
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
		     
		  // 최근 본 목록 이벤트
		     $(".item-list>li.prod #aaa").click(function () {
		    	 iNo = $(this).find("#inputiNo1").val();
		    	 $.ajax({
							url:"/Webkings/product.do",
							type:"GET",
							data:"iNo="+iNo,
							dataType:"text",
							success:function(res){
								
							},
						error:function(xhr, status, error){
							}
					});
		    	}); 
		  // 즐겨찾기 이벤트  
		    $(".item-list>li.prod .favor").click(function (e) {
		    	e.stopPropagation();
				e.preventDefault();
		    	iNo = $(this).find("#inputiNo").val();
		    	sNo = $(this).find("#inputsNo").val();
		    	$.ajax({
						url:"/Webkings/myitem.do",
						type:"GET",
						data:"iNo="+iNo+"&sNo="+sNo,
						dataType:"text",
						success:function(res){
		
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
function share_tw(){
	  var content = "트윗트윗 트윗트윗\r\n\r\n";
	  var link = "https://www.google.co.kr";
	  var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
	  var wp = window.open("http://twitter.com/share?url=" + encodeURIComponent(link) + "&text=" + encodeURIComponent(content), 'twitter', popOption); 
	  if ( wp ) {
	    wp.focus();
	  }     
	}
