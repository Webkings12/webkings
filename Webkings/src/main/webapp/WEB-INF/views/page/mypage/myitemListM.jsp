<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
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
<script type="text/javascript">
$(document).ready(function() {
	
	$(".item-list>li.prod #favor1").click(function (e) {
		e.stopPropagation();
		e.preventDefault();
		$.ajax({
			url:"/Webkings/myitemdelete.do",
			type:"GET",
			data:"iNo="+$("#itemiNo").val()+"&mNo="+$("#itemmNo").val(), //요청 파라미터
			dataType:"text",
			success:function(res){
				alert("관심상품에서 삭제하였습니다");
				$(location).attr('href', "/Webkings/myitemList.do?gender=M");
			},
			error:function(xhr, status, error){
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
<h1 style="text-align: center;">관심상품   <span style="color:#0fb6c5;">${list}</span></h1>
	<c:if test="${empty myitemList }">
	</c:if>
	<c:if test="${!empty myitemList }">
		<c:forEach var="item" items="${myitemList }">
	<li class="prod ${gender} ia" id="prod2" style="list-style: none;">
		<a href="http://${ item.iDomain}"  target="_blank" sseq="121" seq="1349867" maindate="20160908">
		<input type="hidden" id="itemiNo" name="iNo" value="${item.iNo }">
		<input type="hidden" id="itemmNo" name="mNo" value="${item.mNo }">
			<img src="<c:url value='/ItemImage/${item.iImage}'/>" data-original="http://img.sta1.kr/_up/prod/main/2016/09/08/1473208334629_w.jpg"
				style="height: 340px; display: block;" class="item">
				<span class="favor" id="favor1">관심상품</span>
				<div class="info">	<span class="shop" style="color:#e6178f;">${item.sName}</span>		
				<span class="name">${item.iName}</span>	<em class='cate' cate="101">${item.itName}</em>
					<c:if test="${!empty item.iSaleprice}">
						<i><s><fmt:formatNumber value="${item.iPrice}" pattern="#,###" /></s><fmt:formatNumber value="${item.iSaleprice}" pattern="#,###"/> </i>
				</c:if>
				<c:if test="${empty item.iSaleprice}">
						<i><fmt:formatNumber value="${item.iPrice}" pattern="#,###" /></i>
				</c:if>
					<div class="btn">
					<span class="fb">
						<input type='hidden' id='fbTitle' value="${item.iName }"/>
						<input type='hidden' id='fbUrl' value="${item.iDomain}"/>
						<input type='hidden' id='fbImage' value="${item.iImage}"/>
						<input type='hidden' id='fbContent' value="${item.itName}"/>
					</span><i>페이스북 공유</i>
					<span class="tw">
						<input type="hidden" id="itN" value="${item.iName}"/>
						<input type="hidden" id="doma" value="${ item.iDomain}"/>
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
</div>
<div id="loading"></div>