<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/foot.css"/>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript" src="<c:url value='/js/mainF.js'/>"></script>
<script type="text/javascript">
var itemSel=[];
var nItemSel=[];
var page="/search";
var pageNum="${pageNum}";
$(document).ready(function() {
	$(".gnb li").mouseenter(function() {
		$(this).addClass("active");
	})
	$(".gnb li").mouseleave(function() {
		$(this).removeClass("active");
		$(".gnb li:nth-of-type("+pageNum+")").addClass("active");
	});
	});
</script>
<%@ include file="../../inc/top.jsp"  %>

<div class="body-sec"><div class="in-sec">
<p class="privacy-fixed"><a href="privacy.do?gender=F">개인정보처리방침</a></p>
<div class="not-top">
</div>
</div>
</div>
<%@ include file="../../inc/footer-sec.jsp" %>
<div id="loading"></div>
</body>
</html>