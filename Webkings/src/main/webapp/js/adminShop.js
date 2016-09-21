/**
 * 
 */
$(document).ready(function() {
	var sNo="";
			 $.ajax({
				url:url,
				type:"GET",
				data: "gender="+gender+"&style="+style+"&searchName="+searchName,
				async:false,
				dataType:"json",
				success:function(res){
					styleSel = res.shopList;
					var result="";
					var noResult="";
			if(styleSel!=null && styleSel!=""){
					if(styleSel!=null){
						$.each(styleSel, function(idx, item) {
						result+=
						"<li class='shop  "+gender+" ia'><a href='javascript:;' seq='271'>"	+
						"<input type='checkbox' id='chk' value='"+item.sNo+"' style='display:none;'/>"+
						"<img src='/Webkings/shopImage/"+item.sSimage+"' " +
						"data-original='http://img.sta1.kr/_up/shop/logo/2016/08/1471857259160_n1.jpg' class='item' style='display: block;'>"+
						"<div class='over'><div class='btn'>" +
						"<span class='fb sns'><input type='hidden' id='inputsNo' name='sNo' value='"+item.sNo+"'>		" +
						"</span><i>삭제</i></div>" +
						"<div class='bg'></div>	</div>	<div class='info'>"	+
						"<strong><i>"+(idx+1)+"위</i>"+item.sName+"</strong>	<span><i cate='206'>"+item.stName+"</i></span>	<em class=''></em>	</div>"+
						"</a></li>";
						});
					}
					$(".item-list").html(result);
				}else{
						noResult+="<div class='not-top'><div class='not-item'>검색 결과가 없습니다.</div></div>";
						$(".item-list").html(noResult);
					}
				},
				error:function(xhr, status, error){
					alert(error);
				}
			}); 
			 $(".option-sec-2 input[type=text]").val(searchName);
			 if($(".option-sec-2 input[type=text]").val()!=""){
				 $(".option-sec-2 input[type=text]").focus();
			 }
			 
			
			$(".item-list>li.shop .over .btn span").click(function(e) {
				e.stopPropagation();
				e.preventDefault(); 
				var sNo= $(this).find("input").val();
					if (confirm("리스트에서 제거 하시겠습니까?") == true){    //확인
						$(location).attr('href', "/Webkings/adminShopDel.do?sNo="+sNo+"&gender="+gender);
					}else{   //취소
					    return;
					}
			});
			
			
			/*다중 삭제*/
			$("div.body-sec>div.in-sec p#adminDelete>a").click(function() {
				var count = $(".item-list>li.shop>a input[type=checkbox]:checked").length;
				
				if(count==0){
					alert("비활성화 시킬 샵을 먼저 체크하세요");
					return false;
				}
				var shopArray=[];
				$(".item-list>li.shop>a input:checkbox[id='chk']:checked").each(function() {
					shopArray.push($(this).val());
				});
				if (confirm("샵을 비활성화 시키겠습니까?") == true){    //확인
					$.ajax({
						url:MultiDelUrl,
						type:"POST",
						async:false,
						data:"shopValArray="+shopArray+"&gender="+gender,
						dataType:"json",
						success:function(res){
							alert(res);
							$(location).attr('href', "/Webkings/adminShopView.do?gender="+gender);
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
			$(".item-list>li.shop>a").click(function() {
				if($(this).find("input:checkbox[id='chk']").is(":checked")==true){
					$(this).find("input:checkbox[id='chk']").prop("checked", false);
					$(this).removeClass("active");
				}else{
					$(this).find("input:checkbox[id='chk']").prop("checked", true);
					$(this).addClass("active");
				}
			});
});
function enterSearch(){
	searchName = $(".option-sec-2 input[type=text]").val();
	$(location).attr('href', "/Webkings/adminShopView.do?gender="+gender+"&style="+style+"&searchName="+searchName);
}