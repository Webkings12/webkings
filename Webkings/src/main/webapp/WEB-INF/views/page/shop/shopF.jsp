<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript" src="<c:url value='/js/mainF.js'/>"></script>
<script type="text/javascript">
$(document).ready(function() {
	var pageNum = ${pageNum};
	$(".gnb li:nth-of-type("+pageNum+")").addClass("active");
	
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
<%@ include file="../../inc/top.jsp" %>
<div class="body-sec">
<div class="in-sec">
<p class="privacy-fixed"><a href="/policy/privacy">개인정보처리방침</a></p><div>
	<div class="list-top-1">
		<p class="notice-1">샵 순위는 매주 <em>월요일</em> 반영됩니다.</p>
		<div class="tab-type-1">
			<ul>
				<li class="active">
					<dl class="shop-cate-sel">
						<dt><a href="javascript:;">스타일 전체</a></dt>
					<dd><a href="/ranking/women"><em>쇼핑몰 전체</em></a></dd>
					<c:forEach var="StyleVO" items="${styleList}">
						<dd>
							<a href="#">
								<em>${StyleVO.stName}</em>
							</a>
						</dd>
					</c:forEach>
					</dl>
				</li>
			</ul>
		</div>
			<div class="option-sec-2">
			<input type="text" id="quickSearch" placeholder="샵 이름으로 검색">
		</div>
	</div>

	<ul class="item-list" style="visibility: visible;">
		<li class="shop sec-2  F ia">
		<a href="javascript:;" seq="121">	
		<img src="http://img.sta1.kr/_up/shop/logo/2016/09/1473406293970_a1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/09/1473406293970_a1.jpg" class="item" style="display: block;">
			<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>	
				<p><i>316,800</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">	
					<strong>갠소</strong>		<span><i cate="201">러블리</i>, <i cate="215">심플베이직</i></span>		
					<em class="">팔로우</em>
					</div></a></li>
		<li class="shop  F ia"><a href="javascript:;" seq="271">	
		<img src="http://img.sta1.kr/_up/shop/logo/2016/08/1471857259160_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1471857259160_n1.jpg" class="item" style="display: block;">
			<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>
					<p><i>1,183,000</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">	
						<strong><i>1위</i>육육걸즈</strong>		<span><i cate="206">십대쇼핑몰</i></span>		<em class="">팔로우</em>	</div>
		</a></li>
		</ul>
	</div>
	</div>
</div>
</body>
</html>