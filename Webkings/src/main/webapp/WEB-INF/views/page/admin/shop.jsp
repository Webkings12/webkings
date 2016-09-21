<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp" %>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript">
var style="${style}";
var url ="<c:url value='/adminShopSel.do'/>";
var searchName="${searchName}";
</script>
<script type="text/javascript" src="<c:url value='/js/adminShop.js'/>"></script>
<div class="body-sec">
<div class="in-sec">
<p class="privacy-fixed" id="adminPf"><a href="<c:url value='/admin.do'/>">홈으로</a></p>
<div>
<div class="list-top-1">
<p class="sep">샵 관리</p>
		<div class="tab-type-1">
			<ul>
			<li>
				<dl class="age-sel">
								<dt><a href="javascript:;">
								<c:if test="${gender=='F' }">
									여성
								</c:if>
								<c:if test="${gender=='M' }">
									남성
								</c:if> 
								</a> </dt>
								<dd><a href="/Webkings/adminShopView.do?gender=F">
										<em>여성</em></a></dd>
								<dd><a href="/Webkings/adminShopView.do?gender=M">
										<em>남성</em></a></dd>
					</dl>
				</li>
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
	<ul class="item-list" style="visibility: visible;">
	
	</ul>

<%@ include file="../../inc/adminFooter.jsp" %>
</div>
</div>
</div>
</body>
</html>