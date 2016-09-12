/**
 * 
 */
function searchItem(){
	alert(sw2);
	if($("#sw2").val()!=null){
		sw2=$("#sw2").val();
	}
	if($("#ssp").val()!=null){
		ssp=$("#ssp").val();
	}
	if($("#sep").val()!=null){
		sep=$("#sep").val();
	}
	if($("#age1").is(":checked")){
		sac=$(this).val();
	}
	else if($("#age2").is(":checked")){
		sac=$(this).val();
	}
	else if($("#age3").is(":checked")){
		sac=$(this).val();
	}
	return true;
}

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
					$(location).attr('href', "/Webkings/item/itemCate.do?page=/product&gender="+gender+"&cate="+itemCate+"&orderVal="+orderVal);
				});
				
				$("a.aw-1").append(orderName);
				$("a.aw-1").click(function(){
					$(location).attr('href', "/Webkings/item/itemCate.do?page=/product&gender="+gender+"&cate="+itemCate+"&orderVal="+orderVal);
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
