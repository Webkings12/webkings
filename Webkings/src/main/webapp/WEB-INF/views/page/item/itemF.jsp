<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript" src="<c:url value='/js/mainF.js'/>"></script>
<script type="text/javascript">
var gender = "${param.gender}";
var itemSel=[];
var url="<c:url value='/item/selectAll.do'/>";
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
						<dd><a>ALL</a></dd>
						<c:forEach var="Item_TypeVO" items="${itemList}">
										<dd><a href="#">${Item_TypeVO.itName}</a></dd>
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
				<span>TODAY</span><strong>09.09</strong><em>116</em>개의 신상품 추천
			</div>
		</li>
		
		
		
	
		<li class="prod F ia">
			
			
		</li>
		<%-- <c:forEach>
			<li class="prod F ia">
				<a href="javascript:;" sseq="121" seq="1349867" maindate="20160908">	
					<img src="<c:url value='ItemInfo/img/noImage.jpg'/>" 
					  data-original="http://img.sta1.kr/_up/prod/main/2016/09/08/1473208334629_w.jpg" 
					  style="height: 340px; display: block;" class="item">
					<span class="favor">관심상품</span>	
					<div class="info">	<span class="shop">갠소</span>		
						<span class="name">빈티지박시후드집업(4차 재입고)</span>	<em class="cate" cate="101">OUTER</em><i>35,200</i>		
						<div class="btn">
							<span class="fb"></span><i>페이스북 공유</i><span class="tw"></span><i>트위터 공유</i>
						</div>	
					</div>	
					<div class="bg"></div>
				</a>
			</li>
		</c:forEach> --%>
		</ul>
</div>
</div>
</div>
</body>
</html>

