<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript" src="<c:url value='/js/mainF.js'/>"></script>
<script type="text/javascript">
var itemCate= "${param.cate}";
var itemSel=[];
var orderVal="${param.orderVal}";
var itCount;
var itAllCount;
var orderName="${orderName}";
var url="<c:url value='/item/itemSelectName.do'/>";
var itemSearchVo = "${itemSearchVo}";
//search
var sw2="${param.sw2}";
var sac="${param.sac}";
var ssp="${param.ssp}";
var sep="${param.sep}";
</script>
<script type="text/javascript" src="<c:url value='/js/itemCateView.js'/>"></script>
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
		<p class="notice-2"><strong>카테고리 전체 : </strong> <em></em> <i>total</i></p>
			<div class="tab-type-1 tab-type-main">
			<ul>
				<li>
					<dl class="age-sel">
						<dt><a href="#" onclick="gbn()">신상품 추천</a></dt>
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
				
				<li class="active">
					<dl class="prod-cate-sel">
					<dt><a href="#"></a></dt>
						<dd><a href="/Webkings/item/itemCate.do?page=/product&gender=F&cate=ALL">
						ALL</a></dd>
						<c:forEach var="Item_TypeVO" items="${itemList}">
						<dd><a href="/Webkings/item/itemCate.do?page=/product&gender=F&cate=${Item_TypeVO.itName}&orderVal=${orderVal}">
						${Item_TypeVO.itName}</a></dd>
						</c:forEach>
					</dl>
				</li>
			</ul>
		</div>
		<div class="option-sec-1">
			<ul>
				<li class="order">
					<a href="#"	class="aw-1"></a>
					<ul>
						<li><a href="javascript:;"><input type="hidden" value="0">신상품순</a></li>
						<li><a href="javascript:;"><input type="hidden" value="1">클릭순</a></li>
						<li><a href="javascript:;"><input type="hidden" value="2">높은 가격순</a></li>
						<li><a href="javascript:;"><input type="hidden" value="3">낮은 가격순</a></li>
					</ul>
				</li>

				<li class="detail-search">
					<a href="javascript:;" class="search-1">상세검색</a>
					<div class="sec"><div class="in">
					<form id="_frmDetailSearch" action="/Webkings/item/itemCate.do">
						<input type="hidden" name="page" value="/product">
						<input type="hidden" name="orderVal" id="orderVal" value="">
						<input type="hidden" name="gender" value="F">
						<input type="hidden" name="cate" id="cate" value="">
						<p><input type="text" name="sw2" value="" fieldname="검색어" placeholder="결과내 재검색" 
						checkfunctionname="checkSpecialChar" restrictutf8bytes="45"
						 confirmmessage="특수문자로 검색하실수 없습니다." autocomplete="off" focus="off">
						 </p>
						<div>
							<label>가격대</label>
							<input type="text" name="ssp" id="ssp" value=""> ~ <input type="text" id="sep" name="sep" value="">
						</div>
						<div>
							<label>연령대</label>
							<ul>
								<li><input type="radio" name="sac" value="1"  id="age1"><label for="age1">10대</label></li>
								<li><input type="radio" name="sac" value="2"  id="age2"><label for="age2">20대</label></li>
								<li><input type="radio" name="sac" value="3"  id="age3"><label for="age3">30대</label></li>
							</ul>
						</div>
						<div class="btn">
							<input type="submit" value="선택항목으로 검색">
							<a href="javascript:;" class="reset">초기화</a>
						</div>
					</form>
					</div></div>
				</li>
			</ul>
		</div>
	</div>
	<ul class="item-list abs-list" style="height: 4879px;">
		
	</ul>
</div>
<!-- <form id="pageFrm" name="pageFrm" method="get" target="_self">
	<input type="hidden" name="cs" value="100" />
	<input type="hidden" name="sw2" value="" />
</form> -->
</div>
</div>
</body>
</html>