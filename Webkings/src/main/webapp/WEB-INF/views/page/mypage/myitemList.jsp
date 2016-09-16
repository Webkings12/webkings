<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<div class="body-sec">
<div class="in-sec">
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
	<li class="prod '+item.itGender+' ia" id="prod2">
		<a href="" sseq="121" seq="1349867" maindate="20160908">
			<img src="../../itemImage/${item.mIImage}" data-original="http://img.sta1.kr/_up/prod/main/2016/09/08/1473208334629_w.jpg"
				style="height: 340px; display: block;" class="item">
				<span class="favor" id="favor">관심상품</span>
				<div class="info">	<span class="shop">${item.mIName}</span>		
				<span class="name">${item.mIName}</span>	<em class='cate' cate="101">${item.mIName}</em>
				<!-- <i>item.iSalePrice+"</i>	 -->	
					<div class="btn">
					<span class="fb"></span><i>페이스북 공유</i><span class="tw"></span><i>트위터 공유</i>
									</div>	
								</div>	
								<div class='bg'></div>
							</a>
						</li>
			</c:forEach>
			</c:if>
</div>
</div>
</div>