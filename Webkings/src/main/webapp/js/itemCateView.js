/**
 * 
 */
$(document).ready(function() {
			 $.ajax({
				url:url,
				type:"GET",
				data: "gender="+gender+"&cate="+itemCate+"&orderVal="+orderVal+"&sw2="+sw2+"&ssp="+ssp+"&sep="+sep+"&sac="+sac,
				async:false,
				dataType:"json",
				success:function(res){
					itCount = res.itCount;
					itemSel = res.itemList;
					itAllCount = res.itAllCount;
					var result="";
					if(itemCate!=null && itemCate!="" && itemCate !="ALL"){
					result += "<li class='tit-cate "+gender+"' style='left: 0px; top: 0px;'>" +
							"<div><strong></strong><span><em></em>개의 상품 검색</span></div></li>";
					}
					$.each(itemSel, function(idx, item) {
					result+=
					"<li class='prod "+gender+"'>"+
						"<a id='aaa1' href='http://"+item.iDomain+"'  target='_blank' sseq='121' seq='1349867' maindate='20160908'>"+
						"<input type='hidden' id='itemiNo' name='iINo' value='"+item.iNo+"'>"+
							"<img src='../../itemImage/"+item.iImage+"' data-original='http://img.sta1.kr/_up/prod/main/2016/09/08/1473208334629_w.jpg'"+
							"style='height: 340px; display: block;' class='item'>"+

							"<span class='favor'>관심상품<input type='hidden' id='inputiNo' name='iINo' value='"+item.iNo+"'>" +
										"<input type='hidden' id='inputsNo' name='iSNo' value='"+item.sNo+"'></span>"+

							"<span class='favor' id='addItem'>관심상품<input type='hidden' id='inputiNo' name='iINo' value='"+item.iNo+"'></span>"+
							"<div class='info'>	<span class='shop'>"+item.sName+"</span>"+		
								"<span class='name'>"+item.iName+"</span>	<em class='cate' cate='101'>"+item.itName+"</em><i>"+
								item.iSalePrice+"</i>"+		
								"<div class='btn'>"+
									"<span class='fb'>" +
									"<input type='hidden' id='fbTitle' value='"+item.iName+"'/>"+
									"<input type='hidden' id='fbUrl' value='"+item.iDomain+"'/>" +
									"<input type='hidden' id='fbImage' value='"+item.iImage+"'/>" +
									"<input type='hidden' id='fbContent' value='"+item.itName+"'/>" +
									"</span><i>페이스북 공유</i>" +
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
					$(".item-list.abs-list").html(result);
				},
				error:function(xhr, status, error){
					alert(error);
				}
			}); 
			 
			$(".notice-2 em").append(itAllCount);
			$(".item-list>li.tit-cate>div strong").append(itemCate); 
			$(".item-list>li.tit-cate>div span em").append(itCount);
			 
		$(".option-sec-1>ul>li.order ul a").click(function(){
					orderVal=$(this).find("input").val();
					$(location).attr('href', "/Webkings/item/itemCate.do?page=/product&gender="+gender+"&cate="+itemCate+"&orderVal="+orderVal+"&sw2="+sw2+"&ssp="+ssp+"&sep="+sep+"&sac="+sac);
				});
				
		$("a.aw-1").append(orderName);
		$("a.aw-1").click(function(){
			$(location).attr('href', "/Webkings/item/itemCate.do?page=/product&gender="+gender+"&cate="+itemCate+"&orderVal="+orderVal+"&sw2="+sw2+"&ssp="+ssp+"&sep="+sep+"&sac="+sac);
		});
		
		/*검색창 값넣기*/
		if(sw2!=""){
			$(".option-sec-1>ul>li.detail-search .sec p input").val(sw2);
		}
		if(ssp!=""){
			$(".option-sec-1>ul>li.detail-search .sec div input[name=ssp]").val(ssp);
		}
		if(sep!=""){
			$(".option-sec-1>ul>li.detail-search .sec div input[name=sep]").val(sep);
		}
		if(sac!=" "){
			if(sac=="1"){
				$(".option-sec-1>ul>li.detail-search .sec div ul li input[id=age1]").prop("checked", true);
			}else if(sac=="2"){
				$(".option-sec-1>ul>li.detail-search .sec div ul li input[id=age2]").prop("checked", true);
			}else if(sac=="3"){
				$(".option-sec-1>ul>li.detail-search .sec div ul li input[id=age3]").prop("checked", true);
			}
		}
		
		/*초기화*/
		if(itemCate=="ALL" || itemCate==""){
			$(".tab-type-1 ul li.active dl dt a").append("전체상품");
		}else{
			$(".tab-type-1 ul li.active dl dt a").append(itemCate);
			$(".option-sec-1>ul>li.detail-search .sec div #cate").val(itemCate);
		}
		$(".option-sec-1>ul>li.detail-search .sec div #orderVal").val(orderVal);
		
		
		$(".option-sec-1>ul>li.detail-search .sec div.btn a.reset").click(function() {
			$(".option-sec-1>ul>li.detail-search .sec p input").val("");
			$(".option-sec-1>ul>li.detail-search .sec div input[name=ssp]").val("");
			$(".option-sec-1>ul>li.detail-search .sec div input[name=sep]").val("");
			
			$(".option-sec-1>ul>li.detail-search .sec div ul li input[id=age1]").prop("checked", false);
			$(".option-sec-1>ul>li.detail-search .sec div ul li input[id=age2]").prop("checked", false);
			$(".option-sec-1>ul>li.detail-search .sec div ul li input[id=age3]").prop("checked", false);
		});
		
/*		 아이템 클릭 업데이트
		 $(".item-list>li.prod>a").click(function() {
			
			iNo = $(this).find("#inputiNo").val();
			 $.ajax({
				 url:itemUpdateUrl,
				 type:"GET", 
				 data: "iNo="+iNo,
				 async:false,
				 dataType:"json",
				 success:function(res){
					 alert("gg");
				 },error:function(xhr, status, error){
						alert(error);
				}
			 });
		});*/
		
		/*트위터*/
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
		 // 최근 본 목록 이벤트
	   /*  $(".item-list>li.prod #aaa1").click(function () {
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
	    	}); */
	  // 즐겨찾기 이벤트  
	   /* $(".item-list>li.prod .favor").click(function (e) {
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
	    });*/
		
		 /*페이스북*/
		$(".item-list>li.prod .info .btn .fb").click(function(e) {
			e.stopPropagation();
			e.preventDefault();
			
			fbTitle=$(this).find("#fbTitle").val();
			fbUrl= $(this).find("#fbUrl").val();
			fbImage= $(this).find("#fbImage").val();
			fbContent=$(this).find("#fbContent").val();
			
			
		  var popOption = "width=600, height=400, resizable=no, scrollbars=no, status=no;";
		  window.open("http://www.facebook.com/sharer/sharer.php?u="+fbUrl, "share",popOption); 
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
