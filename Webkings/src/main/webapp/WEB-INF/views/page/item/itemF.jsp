<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript" src="<c:url value='/js/mainF.js'/>"></script>
<script type="text/javascript">
var itemAge = "${param.ageSel}";
var itemSel=[];
var url="<c:url value='/item/selectItem.do'/>";
</script>
<script type="text/javascript" src="<c:url value='/js/itemView.js'/>"></script>
<script type="text/javascript">
$(document).ready(function() {
	var pageNum = ${pageNum};
	$(".gnb li:nth-child("+pageNum+")").addClass("active");
	
	$(".gnb li").mouseenter(function() {
		$(".gnb li").removeClass("active");
		$(this).addClass("active");
	})
	$(".gnb li").mouseleave(function() {
		$(this).removeClass("active");
		$(".gnb li:nth-of-type("+pageNum+")").addClass("active");
	});
});
</script>
<%@ include file="../../inc/top.jsp"  %>
<div class="body-sec">
<div class="in-sec">
<p class="privacy-fixed"><a href="/policy/privacy">개인정보처리방침</a></p><div>
	<div class="list-top-1">
		<p class="notice-1">매일 업데이트 되는 <em>5,000 여개의 신상품</em> 중에서 추천</p>
		<div class="tab-type-1 tab-type-main" >
			<ul>
				<li class="active">
					<dl class="age-sel">
						<dt><input type="hidden" id="ageS" value="${age}">
						<a href="#"> 
						${age}
						</a> 
						</dt>
						<dd><a href="/Webkings/page.do?page=/item&gender=F">
								<em>전체 연령대</em></a></dd>
						<dd><a href="/Webkings/page.do?page=/item&gender=F&ageSel=10">
								<em>10대 신상품</em></a></dd>
						<dd><a href="/Webkings/page.do?page=/item&gender=F&ageSel=20">
								<em>20대 신상품</em></a></dd>
						<dd><a href="/Webkings/page.do?page=/item&gender=F&ageSel=30">
								<em>30대 신상품</em></a></dd>
					</dl>
				</li>
				<li>
					<dl class="prod-cate-sel">
						<dt><a href="#" onclick="gbn()">전체 상품</a></dt>
						<dd><a href="/Webkings/item/itemCate.do?page=/product&gender=F&cate=ALL">ALL</a></dd>
						<c:forEach var="Item_TypeVO" items="${itemList}">
						<dd><a href="/Webkings/item/itemCate.do?page=/product&gender=F&cate=${Item_TypeVO.itName}">${Item_TypeVO.itName}</a></dd>
						</c:forEach>
					</dl>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- 상품 이미지 -->
	<ul class="item-list">
		<li class="plan-sec">
			<div class="list">
				<ul>
					<li>
						<a href="/exhibition/62"><img src="http://img.sta1.kr/_up/exhib/2016/08/1472187676462_wm.png" class="item"></a>
					</li>
					<li>
						<a href="/exhibition/65"><img src="http://img.sta1.kr/_up/exhib/2016/08/1472635035374_wm.png" class="item"></a>
					</li>
					<li>
						<a href="/exhibition/57"><img src="http://img.sta1.kr/_up/exhib/2016/08/1472031294631_wm.png" class="item"></a>
					</li>
					<li>
						<a href="/exhibition/63"><img src="http://img.sta1.kr/_up/exhib/2016/08/1472548791421_wm.png" class="item"></a>
					</li>
					<li>
						<a href="/exhibition/60"><img src="http://img.sta1.kr/_up/exhib/2016/08/1472054776607_wm.png" class="item"></a>
					</li>
				</ul>
			</div>
			<a href="#exhibition" class="total">전체보기</a>
			<div class="paging"><span class="active">1</span><span>2</span><span>3</span><span>4</span><span>5</span></div>
		</li>
		
		<li class="bnr-1">
			<a href="https://play.google.com/store/apps/details?id=com.sta1.front&amp;hl=ko" target="_blank">
			<img src="http://img.sta1.info/rsc/front/img/bnr-1.png" class="item"></a>
		</li>	
		
		<li class="date">
			<div class="sec today">
				<span>TODAY</span><strong>09.11</strong><em>116</em>개의 신상품 추천
			</div>
		</li>
		<li class="prod F ia">
			
		</li>
		</ul>
</div>
</div>
</div>
</body>
</html>