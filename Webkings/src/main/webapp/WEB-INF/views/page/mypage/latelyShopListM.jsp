<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/mainF.js'/>"></script>
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
<div class="body-sec">
<div class="in-sec">
<input type="hidden" id="myPageVal" value="latelyShopList">
<div class="item-list">
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h1 style="text-align: center;">최근본샵<span style="color:#0fb6c5;">${size}</span></h1>
	<c:if test="${empty shopmap }">
	</c:if>
	<c:if test="${!empty shopmap }">
	<ul class="item-list shop-search" style="display: block;">
		<c:forEach var="shop" items="${shopmap}">
			<c:forEach var="s" items="${shop.value}">		
					<li class="shop ${gender} ia" style="display: list-item;"><a href="http://${s.sDomain}" target="_blank" seq="121">	
					<img src="${s.sSimage}" 
					data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1472529181667_n1.jpg" class="item" style="display: block;">
						<div class='over'>	<input type='hidden' id='inputsNo' name='sNo' value="${s.sNo}">	<div class="btn">
						<span class="fb sns">
						<input type="hidden" id="fbTitle" value="${s.sName}"/>
						<input type="hidden" id="fbUrl" value="${s.sDomain}"/>
						<input type="hidden" id="fbImage" value="${s.sSimage}"/>
						<input type="hidden" id="fbContent" value="${s.stName}"/>
						</span><i>페이스북 공유</i>
						<span class="tw sns">
						<input type="hidden" id="itN" value="${item.sName}"/>
						<input type="hidden" id="doma" value="${item.sDomain}"/>
						</span>
						<i>트위터 공유</i></div>
						<p><i>316,800</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info"><strong>"${s.sName}</strong>
						<span><i cate="201">${s.stName}</i></span>		<em class="">팔로우</em>	</div></a></li>
			
				</c:forEach>
			</c:forEach>
			</ul>
			</c:if>
			
		
</div>
</div>
</div>