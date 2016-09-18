/**
 * 
 */
$(document).ready(function() {
			 $.ajax({
				url:url,
				type:"GET",
				data: "gender="+gender+"&style="+style+"&searchName="+searchName,
				async:false,
				dataType:"json",
				success:function(res){
					styleSel = res.shopList;
					var result="";
					sNewList =res.shopNewList;
					if(sNewList!=null){
					$.each(sNewList, function(idx, item) {
					 result+=
					"<li class='shop sec-2  F ia'>"+
					"<a href='http://"+item.sDomain+"'  target='_blank' seq='121'>"+	
					"<img src='"+item.sBimage+"' data-original='http://img.sta1.kr/_up/shop/logo/2016/09/1473406293970_a1.jpg' class='item'" +
					" style='display: block;'>"+
					"<div class='over'>		<div class='btn'>" +
					"<span class='fb sns'>" +
					"</span><i>페이스북 공유</i>" +
					"<span class='tw sns'>" +
					"<input type='hidden' id='itN' value='"+item.sName+"'/>"+
					"<input type='hidden' id='doma' value='"+item.sDomain+"'/>" +
					"</span><i>트위터 공유</i></div>"	+
							"<div class='bg'></div>	</div>	<div class='info'>"	+
							"<strong>"+item.sName+"</strong><span><i cate='201'>"+item.stName+"</i></span>"	+	
							"<em class=''>팔로우</em>"+
							"</div></a></li>";
					});
					}
					if(styleSel!=null){
						$.each(styleSel, function(idx, item) {
							result+=
						"<li class='shop  F ia'><a href='http://"+item.sDomain+"'  target='_blank' seq='271'>"	+
						"<img src='"+item.sSimage+"' " +
						"data-original='http://img.sta1.kr/_up/shop/logo/2016/08/1471857259160_n1.jpg' class='item' style='display: block;'>"+
						"<div class='over'>		<div class='btn'>" +
						"<span class='fb sns'>" +
						"<input type='hidden' id='fbTitle' value='"+item.sName+"'/>"+
						"<input type='hidden' id='fbUrl' value='"+item.sDomain+"'/>" +
						"<input type='hidden' id='fbImage' value='"+item.sSimage+"'/>" +
						"<input type='hidden' id='fbContent' value='"+item.stName+"'/>" +
						"</span><i>페이스북 공유</i>" +
						"<span class='tw sns'>" +
						"<input type='hidden' id='itN' value='"+item.sName+"'/>"+
						"<input type='hidden' id='doma' value='"+item.sDomain+"'/>" +
						"</span><i>트위터 공유</i></div>"+
						"<div class='bg'></div>	</div>	<div class='info'>"	+
						"<strong><i>"+(idx+1)+"위</i>"+item.sName+"</strong>	<span><i cate='206'>"+item.stName+"</i></span>	<em class=''>팔로우</em>	</div>"+
						"</a></li>";
						});
					}
					$(".item-list").html(result);
				},
				error:function(xhr, status, error){
					alert(error);
				}
			}); 
			 $(".option-sec-2 input[type=text]").val(searchName);
			 if($(".option-sec-2 input[type=text]").val()!=""){
				 $(".option-sec-2 input[type=text]").focus();
			 }
			 
			 /*트위터*/
			 $(".item-list>li.shop .over .btn .tw.sns").click(function(e) {
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
			 $(".item-list>li.shop .over .btn .fb.sns").click(function(e) {
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
function enterSearch(){
	searchName = $(".option-sec-2 input[type=text]").val();
	$(location).attr('href', "/Webkings/shop/shopView.do?gender="+gender+"&style="+style+"&searchName="+searchName);
}