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
						"<img src='/Webkings/shopImage/"+item.sSimage+"' " +
						"data-original='http://img.sta1.kr/_up/shop/logo/2016/08/1471857259160_n1.jpg' class='item' style='display: block;'>"+
						"<div class='over'><div class='btn'>" +
						"<span class='fb sns'><input type='hidden' id='inputsNo' name='sNo' value='"+item.sNo+"'>		" +
						"</span><i>삭제</i></div>" +
						"<div class='bg'></div>	</div>	<div class='info'>"	+
						"<strong><i>"+(idx+1)+"위</i>"+item.sName+"</strong>	<span><i cate='206'>"+item.stName+"</i></span>	<em class=''>팔로우</em>	</div>"+
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
			 
			$(".item-list>li.shop .info em").click(function(e) {
				e.preventDefault();
				alert("서비스 준비중입니다");
			});
			
			$(".item-list>li.shop .over .btn span").click(function() {
				var sNo= $(this).find("input").val();
					if (confirm("정말 삭제하시겠습니까?") == true){    //확인
						$(location).attr('href', "/Webkings/adminShopDel.do?sNo="+sNo+"&gender="+gender);
					}else{   //취소
					    return;
					}
			});
});
function enterSearch(){
	searchName = $(".option-sec-2 input[type=text]").val();
	$(location).attr('href', "/Webkings/adminShopView.do?gender="+gender+"&style="+style+"&searchName="+searchName);
}