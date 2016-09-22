<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript" src="<c:url value='/js/mainF.js'/>"></script>
<script type="text/javascript">
var style="${style}";
alert(style);
var url ="<c:url value='/shop/shopStyle.do'/>";
var searchName="${searchName}";
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
<p class="privacy-fixed"><a href="privacy.do?gender=F">개인정보처리방침</a></p><div>
	<div class="list-top-1">
		<p class="notice-1">샵 순위는 매주 <em>월요일</em> 반영됩니다.</p>
		<div class="tab-type-1">
			<ul>
				<li class="active">
					<dl class="shop-cate-sel">
						<dt><a href="/Webkings/shop/shopView.do?gender=F&style=${style}&searchName=${style}">
						<c:if test="${style ne 'all'}">
						 ${style}
						</c:if>
						<c:if test="${style eq 'all'}">
						 쇼핑몰 전체
						</c:if> 
						</a></dt>
					<dd><a href="/Webkings/shop/shopView.do?gender=F&searchName=${searchName}"><em>쇼핑몰 전체</em></a></dd>
					<c:forEach var="StyleVO" items="${styleList}">
						<dd>
							<a href="/Webkings/shop/shopView.do?gender=F&style=${StyleVO.stName}&searchName=${searchName}">
								<em>${StyleVO.stName}</em>
							</a>
						</dd>
					</c:forEach>
					</dl>
				</li>
			</ul>
		</div>
			<div class="option-sec-2">
			<input type="text" id="quickSearch"
			placeholder="샵 이름으로 검색" onkeypress="if( event.keyCode==13 ){enterSearch();}">
		</div>
	</div>
	<ul class="item-list" style="visibility: visible;"></ul>
	</div>
	</div>
</div>
</body>
</html>