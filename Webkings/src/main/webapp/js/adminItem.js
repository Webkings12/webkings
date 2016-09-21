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
					itemSel = res.itemList;
					itAllCount = res.itAllCount;
					var result="";
					$.each(itemSel, function(idx, item) {
					result+=
					"<li class='prod "+gender+"'>"+
						"<a id='aaa1' href='javascript:;'  sseq='121' seq='1349867' maindate='20160908'>" +
						"<input type='checkbox' id='chk' value='"+item.iNo+"' style='display:none;'/>"+
						"<input type='hidden' id='itemiNo' name='iINo' value='"+item.iNo+"'>"+
							"<img src='/Webkings/ItemImage/"+item.iImage+"' data-original='http://img.sta1.kr/_up/prod/main/2016/09/08/1473208334629_w.jpg'"+
							"style='height: 340px; display: block;' class='item'>"+
							"<div class='info'>	<span class='shop'>"+item.sName+"</span>"+		
								"<span class='name'>"+item.iName+"</span>	<em class='cate' cate='101'>"+item.itName+"</em>";
								if(item.iSalePrice!=null){
									result+="<i><s>"+item.iPrice+"</s>"+item.iSalePrice+"</i>";
								}else{
									result+="<i>"+item.iPrice+"</i>";
								}	
								result+="<div class='btn'>"+
									"<span class='fb'><input type='hidden' id='inputiNo' name='iINo' value='"+item.iNo+"'>" +
									"</span><i>삭제</i>" +
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
			 
		$(".option-sec-1>ul>li.order ul a").click(function(){
					orderVal=$(this).find("input").val();
					$(location).attr('href', "/Webkings/adminItemView.do?gender="+gender+"&cate="+itemCate+"&orderVal="+orderVal+"&sw2="+sw2+"&ssp="+ssp+"&sep="+sep+"&sac="+sac);
				});
				
		$("a.aw-1").append(orderName);
		$("a.aw-1").click(function(){
			$(location).attr('href', "/Webkings/adminItemView.do?gender="+gender+"&cate="+itemCate+"&orderVal="+orderVal+"&sw2="+sw2+"&ssp="+ssp+"&sep="+sep+"&sac="+sac);
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
		
		$(".item-list>li.prod>a .info .btn span").click(function(e) {
			e.stopPropagation();
			e.preventDefault(); 
			var iNo= $(this).find("input").val();
				if (confirm("정말 삭제하시겠습니까?") == true){    //확인
					$(location).attr('href', "/Webkings/adminItemDel.do?iNo="+iNo+"&gender="+gender);
				}else{   //취소
				    return;
				}
		});
		/*다중 삭제*/
		$("div.body-sec>div.in-sec p#adminDelete>a").click(function() {
			var count = $(".item-list>li.prod>a input[type=checkbox]:checked").length;
			
			if(count==0){
				alert("삭제하려는 상품을 먼저 체크하세요");
				return false;
			}
			var itemArray=[];
			$(".item-list.abs-list li a input:checkbox[id='chk']:checked").each(function() {
				itemArray.push($(this).val());
			});
			if (confirm("정말 삭제하시겠습니까?") == true){    //확인
				$.ajax({
					url:MultiDelUrl,
					type:"POST",
					async:false,
					data:"itemValArray="+itemArray+"&gender="+gender,
					dataType:"json",
					success:function(res){
						alert(res);
						$(location).attr('href', "/Webkings/adminItemView.do?gender="+gender);
					},
				error:function(xhr, status, error){
					alert(error);
				}
				});
			}else{   //취소
			    return;
			}
		});
			
		/*선택삭제시 선택자*/
		$(".item-list.abs-list li a").click(function() {
			if($(this).find("input:checkbox[id='chk']").is(":checked")==true){
				$(this).find("input:checkbox[id='chk']").prop("checked", false);
				$(this).removeClass("active");
			}else{
				$(this).find("input:checkbox[id='chk']").prop("checked", true);
				$(this).addClass("active");
			}
		});
});