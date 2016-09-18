<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
</script>
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
<h1 style="text-align: center;">최근본상품<span style="color:#0fb6c5;">${size}</span></h1>
	<c:set var="map" value="${prodmap }"></c:set>
	<c:if test="${empty prodmap }">
	</c:if>
	<c:if test="${!empty prodmap }">
		<c:forEach var="item" items="${prodmap }">
		
	<li class="prod ${gender} ia" id="prod2" style="list-style: none;">
		<a href="" sseq="121" seq="1349867" maindate="20160908">
			<img src="../../itemImage/${item.iImage}" data-original="http://img.sta1.kr/_up/prod/main/2016/09/08/1473208334629_w.jpg"
				style="height: 340px; display: block;" class="item">
				<span class="favor" id="favor">관심상품</span>
				<div class="info">	<span class="shop">${item.sName}</span>		
				<span class="name">${item.iName}</span>	<em class='cate' cate="101">${item.itName}</em>
				<i>${item.iSalePrice}</i>	
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