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
					var result="";
					itCount = res.itCount;
					itemSel = res.itemList;
					$(".notice-2 em").append(itCount);
					$.each(itemSel, function(idx, item) {
						result=
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
						"</a>";
						
						$(".item-list.abs-list li").html(result);
					});
				},
				error:function(xhr, status, error){
					alert(error);
				}
			}); 
		$(".option-sec-1>ul>li.order ul a").click(function(){
					orderVal=$(this).find("input").val();
					$(location).attr('href', "/Webkings/item/itemCate.do?page=/product&gender="+gender+"&cate="+itemCate+"&orderVal="+orderVal+"&sw2="+sw2+"&ssp="+ssp+"&sep="+sep+"&sac="+sac);
				});
				
		$("a.aw-1").append(orderName);
		$("a.aw-1").click(function(){
			$(location).attr('href', "/Webkings/item/itemCate.do?page=/product&gender="+gender+"&cate="+itemCate+"&orderVal="+orderVal+"&sw2="+sw2+"&ssp="+ssp+"&sep="+sep+"&sac="+sac);
		});
		
		
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
