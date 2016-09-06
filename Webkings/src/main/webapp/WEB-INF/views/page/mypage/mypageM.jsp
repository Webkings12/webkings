<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypage.css"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript" src="<c:url value='/js/mainM.js'/>"></script>
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
<%@ include file="../../inc/top.jsp" %>
<div class="body-sec">
<div class="in-sec">
		<div class="footer">
			<div class="list-top-2">
				<div class="in">
					<div class="tab-type-2">
						<ul>
							<li class="active single"><a href="javascript:;" class="nlink">마이페이지</a></li>
						</ul>
					</div>
				</div>
			</div>
	<div class="in-sec-2">
		<ul class="mypage-btn">
			<li class="login"><a href="#login">로그인</a></li>
			<li class="recent-prod"><a href="/recent/prod">최근 본 상품<em></em></a></li>
			<li class="recent-shop"><a href="/recent/shop">최근 본 샵<em></em></a></li>
			<li class="coupon"><a href="#login">쿠폰북</a></li>
			<li class="favor"><a href="#login">관심상품</a></li>
			<li class="follow"><a href="#login">내팔로잉<em></em></a></li>
		</ul>
	</div>
	<%@ include file="footer-sec.jsp" %>
</div>
</div>
</div>
</body>
</html>