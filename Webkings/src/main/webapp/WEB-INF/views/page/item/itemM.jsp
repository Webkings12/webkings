<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/foot.css"/>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript" src="<c:url value='/js/mainM.js'/>"></script>
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
<p class="privacy-fixed"><a href="privacy.do?gender=M">개인정보처리방침</a></p><div>
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
						<dd><a href="/Webkings/page.do?page=/item&gender=M">
								<em>전체 연령대</em></a></dd>
						<dd><a href="/Webkings/page.do?page=/item&gender=M&ageSel=10">
								<em>10대 신상품</em></a></dd>
						<dd><a href="/Webkings/page.do?page=/item&gender=M&ageSel=20">
								<em>20대 신상품</em></a></dd>
						<dd><a href="/Webkings/page.do?page=/item&gender=M&ageSel=30">
								<em>30대 신상품</em></a></dd>
					</dl>
				</li>
				<li>
					<dl class="prod-cate-sel">
						<dt><a href="#" onclick="gbn()">전체 상품</a></dt>
						<dd><a href="/Webkings/item/itemCate.do?page=/product&gender=M&cate=ALL">ALL</a></dd>
						<c:forEach var="Item_TypeVO" items="${itemList}">
										<dd><a href="/Webkings/item/itemCate.do?page=/product&gender=M&cate=${Item_TypeVO.itName}">${Item_TypeVO.itName}</a></dd>
						</c:forEach>
					</dl>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- 상품 이미지 -->
	<ul class="item-list">
		
	</ul>
</div>
</div>
</div>
<%@ include file="../../inc/footer-sec.jsp" %>
<div id="loading"></div>
</body>
</html>