<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
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
						<dt><a href="javascript:;">10대 신상품</a></dt>
						<dd><a href="javascript:;"><em>전체 연령대</em></a></dd>
						<dd><a href="javascript:;"><em>10대 신상품</em></a></dd>
						<dd><a href="javascript:;"><em>20대 신상품</em></a></dd>
						<dd><a href="javascript:;"><em>30대 신상품</em></a></dd>
					</dl>
				</li>
				<li>
					<dl class="prod-cate-sel">
						<dt><a href="#" onclick="gbn()">전체 상품</a></dt>
						<dd><a>ALL</a></dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>

	<ul class="item-list">
		<li class="plan-sec">
			<div class="list"><ul></ul></div>
			<a href="#exhibition" class="total">전체보기</a>
			<div class="paging"></div>
		</li>
		<li class="bnr-1"><a href="javascript:;" target="_blank"><img src="#" class="item"></a></li>
	</ul>
</div>
</div>
</div>
</body>
</html>