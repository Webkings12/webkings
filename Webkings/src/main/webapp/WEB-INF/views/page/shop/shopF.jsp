<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript" src="<c:url value='/js/mainF.js'/>"></script>
<script type="text/javascript">
var style="${param.style}";
var url ="<c:url value='/shop/shopStyle.do'/>";
var searchName="";
</script>
<script type="text/javascript" src="<c:url value='/js/shop.js'/>"></script>
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
	<ul class="item-list" style="visibility: visible;"></ul>
	</div>
	</div>
</div>
</body>
</html>