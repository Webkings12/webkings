<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script type="text/javascript">
$(document).ready(function() {
	
	$(".item-list>li.prod #favor1").click(function (e) {
		var ithisVal=$(this).find("#itemiNo").val();
		var mthisVal=$(this).find("#itemmNo").val();
		e.stopPropagation();
		e.preventDefault();
		$.ajax({
			url:"/Webkings/myitemdelete.do",
			type:"GET",
			data:"iNo="+ithisVal+"&mNo="+mthisVal, //요청 파라미터
			dataType:"text",
			success:function(res){
				alert("관심상품에서 삭제하였습니다");
				$(location).attr('href', "/Webkings/myitemList.do?gender=F");
			},
			error:function(xhr, status, error){
				alert(error);
			}
		});
	});
	
});
</script>
<div class="body-sec">
<div class="in-sec">
<input type="hidden" id="myPageVal" value="myitemList">
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
<h1 style="text-align: center;">관심상품   <span style="color:#e6178f;">${list}</span></h1>
	<c:if test="${empty myitemList }">
	</c:if>
	<c:if test="${!empty myitemList }"> 
	<c:set var="i" value="${fn:length(myitemList)}"/>
		<c:forEach var="item" begin="0" end="${i-1}" varStatus="status">
	<li class="prod ${gender} ia" id="prod2" style="list-style: none;">
		<a href="http://${myitemList[i-item-1].iDomain}" target="_blank" sseq="121" seq="1349867" maindate="20160908">
			<img src="<c:url value='/ItemImage/${myitemList[i-item-1].iImage}'/>" data-original="http://img.sta1.kr/_up/prod/main/2016/09/08/1473208334629_w.jpg"
				style="height: 340px; display: block;" class="item">
				<span class="favor" id="favor1">관심상품
				<input type="hidden" id="itemiNo" name="iNo" value="${myitemList[i-item-1].iNo }">
				<input type="hidden" id="itemmNo" name="mNo" value="${myitemList[i-item-1].mNo }"></span>
				<div class="info">	<span class="shop" style="color:#e6178f;">${myitemList[i-item-1].sName}</span>		
				<span class="name">${myitemList[i-item-1].iName}</span>	<em class='cate' cate="101">${myitemList[i-item-1].itName}</em>
				
				<c:if test="${!empty myitemList[i-item-1].iSaleprice}">
						<i><s><fmt:formatNumber value="${myitemList[i-item-1].iPrice}" pattern="#,###" /></s><fmt:formatNumber value="${myitemList[i-item-1].iSaleprice}" pattern="#,###"/> </i>
				</c:if>
				<c:if test="${empty myitemList[i-itemi-1].iSaleprice}">
						<i><fmt:formatNumber value="${myitemList[i-item-1].iPrice}" pattern="#,###" /></i>
				</c:if>
				
					<div class="btn">
					<span class="fb">
						<input type='hidden' id='fbTitle' value="${myitemList[i-item-1].iName }"/>
						<input type='hidden' id='fbUrl' value="${myitemList[i-item-1].iDomain}"/>
						<input type='hidden' id='fbImage' value="${myitemList[i-item-1].iImage}"/>
						<input type='hidden' id='fbContent' value="${myitemList[i-item-1].itName}"/>
					</span><i>페이스북 공유</i>
					<span class="tw">
						<input type="hidden" id="itN" value="${myitemList[i-item-1].iName}"/>
						<input type="hidden" id="doma" value="${myitemList[i-item-1].iDomain}"/>
					</span><i>트위터 공유</i>
									</div>	
								</div>	
								<div class="bg"></div>
							</a>
						</li>
			</c:forEach>
		</c:if>
</div>
</div>
<%@ include file="footer-sec.jsp" %>
</div>
<div id="loading"></div>