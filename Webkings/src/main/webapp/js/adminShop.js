/**
 * 
 */
$(document).ready(function() {
	var sNo="";
			 $.ajax({
				url:url,
				type:"GET",
				data: "gender="+gender+"&style="+style+"&searchName="+searchName+"&offVal="+offVal,
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
						"<input type='checkbox' id='chk' name='chk' value='"+item.sNo+"' style='display:none;'/>"+
						"<img src='/Webkings/shopImage/"+item.sSimage+"' " +
						"data-original='http://img.sta1.kr/_up/shop/logo/2016/08/1471857259160_n1.jpg' class='item' style='display: block;'>"+
						"<div class='over'><div class='btn'>";
						if(offVal=="0"){
						result+="<span class='fb sns'><input type='hidden' id='inputsNo' name='sNo' value='"+item.sNo+"'></span><i>제거</i></div>";
						}else{
						result+="<span class='fbadd sns'><input type='hidden' id='inputsNo' name='sNo' value='"+item.sNo+"'></span><i>추가</i></div>";
						}
						result+="<div class='bg'></div>	</div>	<div class='info'>"	+
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
			 
			/*개별삭제*/
			$(".item-list>li.shop .over .btn span.fb").click(function(e) {
				e.stopPropagation();
				e.preventDefault(); 
				var sNo= $(this).find("input").val();
					if (confirm("비활성화 시키겠습니까?") == true){    //확인
						$(location).attr('href', "/Webkings/adminShopDel.do?sNo="+sNo+"&gender="+gender+"&offVal="+offVal);
					}else{   //취소
					    return;
					}
			});
			
			/*개별추가*/
			$(".item-list>li.shop .over .btn span.fbadd").click(function(e) {
				e.stopPropagation();
				e.preventDefault(); 
				var sNo= $(this).find("input").val();
					if (confirm("활성화 시키겠습니까?") == true){    //확인
						$(location).attr('href', "/Webkings/adminShopAdd.do?sNo="+sNo+"&gender="+gender+"&offVal="+offVal);
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
							$(location).attr('href', "/Webkings/adminShopView.do?gender="+gender+"&offVal="+offVal);
						},
					error:function(xhr, status, error){
						alert(error);
					}
					});
				}else{   //취소
				    return;
				}
			});
			
			/*다중 추가*/
			$("div.body-sec>div.in-sec p#adminAdd>a").click(function() {
				var count = $(".item-list>li.shop>a input[type=checkbox]:checked").length;
				
				if(count==0){
					alert("활성화 시킬 샵을 먼저 체크하세요");
					return false;
				}
				var shopArray=[];
				$(".item-list>li.shop>a input:checkbox[id='chk']:checked").each(function() {
					shopArray.push($(this).val());
				});
				if (confirm("샵을 활성화 시키겠습니까?") == true){    //확인
					$.ajax({
						url:MultiAddUrl,
						type:"POST",
						async:false,
						data:"shopValArray="+shopArray+"&gender="+gender,
						dataType:"json",
						success:function(res){
							alert(res);
							$(location).attr('href', "/Webkings/adminShopView.do?gender="+gender+"&offVal="+offVal);
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
			$(".aw-2").append(offName);
			
			/*전체 선택*/
			$("div.body-sec>div.in-sec p#adminAll>a").click(function() {
				var checkA="";
				if($(this).find("input[type=checkbox]").is(":checked")==false){
					$(this).find("input[type=checkbox]").prop("checked", true);
					checkA=true;
				}else{
					$(this).find("input[type=checkbox]").prop("checked", false);
					checkA=false;
				}
				if(checkA){
					$("input:checkbox[name='chk']").prop("checked", true);
					$(".item-list>li.shop>a").addClass("active");
				}else{
					$("input:checkbox[name='chk']").prop("checked", false);
					$(".item-list>li.shop>a").removeClass("active");
				}
			});
			
			
			/*샵 추가*/
			$(".list-top-1>ul>li.order ul a").click(function() {
				offVal=$(this).find("input[type=hidden]").val();
				$(location).attr('href', "/Webkings/adminShopView.do?gender="+gender+"&offVal="+offVal);
			});
});
function enterSearch(){
	searchName = $(".option-sec-2 input[type=text]").val();
	$(location).attr('href', "/Webkings/adminShopView.do?gender="+gender+"&style="+style+"&searchName="+searchName+"&offVal="+offVal);
}