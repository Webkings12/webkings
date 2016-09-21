<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp" %>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript">
var itemCate= "${cateView}";
var itemSel=[];
var orderVal="${orderVal}";
var itAllCount;
var orderName="${orderName}";
var MultiDelUrl="<c:url value='/adminItemMultiDel.do'/>";
var url="<c:url value='/adminItemSel.do'/>";
var itemSearchVo = "${itemSearchVo}";
//search
var sw2="${param.sw2}";
var sac="${param.sac}";
var ssp="${param.ssp}";
var sep="${param.sep}";
</script>
<script type="text/javascript" src="<c:url value='/js/adminItem.js'/>"></script>
<div class="body-sec">
<div class="in-sec">
<p class="privacy-fixed" id="adminDelete"><a href="javascript:;">삭제</a></p>
<p class="privacy-fixed" id="adminPf"><a href="<c:url value='/admin.do'/>">홈으로</a></p>
	<div class="admin">
		<div class="list-top-1">
		<p class="sep">상품 관리</p>
				<div class="tab-type-1 tab-type-main">
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
							<dd><a href="/Webkings/adminItemView.do?gender=F">
									<em>여성</em></a></dd>
							<dd><a href="/Webkings/adminItemView.do?gender=M">
									<em>남성</em></a></dd>
						</dl>
					</li>
					
					<li class="active">
						<dl class="prod-cate-sel">
						<dt><a href="javascript:;"></a></dt>
						<dd><a href="/Webkings/adminItemView.do?gender=${gender}&cate=ALL">
						ALL</a></dd>
						<c:forEach var="Item_TypeVO" items="${itemList}">
						<dd><a href="/Webkings/adminItemView.do?gender=${gender}&cate=${Item_TypeVO.itName}&orderVal=${orderVal}">
						${Item_TypeVO.itName}</a></dd>
						</c:forEach>
					</dl>
					</li>
				</ul>
			</div>
			<div class="option-sec-1">
				<ul>
					<li class="order">
						<a href="javascript:;" class="aw-1"></a>
						<ul>
							<li><a href="javascript:;"><input type="hidden" value="0">신상품순</a></li>
							<li><a href="javascript:;"><input type="hidden" value="1">클릭순</a></li>
							<li><a href="javascript:;"><input type="hidden" value="2">높은 가격순</a></li>
							<li><a href="javascript:;"><input type="hidden" value="3">낮은 가격순</a></li>
						</ul>
					</li>
	
					<li class="detail-search">
						<a href="javascript:;" class="search-1">상세검색</a>
						<div class="sec"><div class="in">
						<form id="_frmDetailSearch" action="/Webkings/adminItemView.do">
							<input type="hidden" name="orderVal" id="orderVal" value="">
							<input type="hidden" name="gender" value="${gender}">
							<input type="hidden" name="cate" id="cate" value="">
							<p><input type="text" name="sw2" value="" fieldname="검색어" placeholder="결과내 재검색" checkfunctionname="checkSpecialChar" restrictutf8bytes="45" confirmmessage="특수문자로 검색하실수 없습니다." autocomplete="off" focus="off">
							 </p>
							<div>
								<label>가격대</label>
								<input type="text" name="ssp" id="ssp" value=""> ~ <input type="text" id="sep" name="sep" value="">
							</div>
							<div>
								<label>연령대</label>
								<ul>
									<li><input type="radio" name="sac" value="1" id="age1"><label for="age1">10대</label></li>
									<li><input type="radio" name="sac" value="2" id="age2"><label for="age2">20대</label></li>
									<li><input type="radio" name="sac" value="3" id="age3"><label for="age3">30대</label></li>
								</ul>
							</div>
							<div class="btn">
								<input type="submit" value="선택항목으로 검색">
								<a href="javascript:;" class="reset">초기화</a>
							</div>
						</form>
						</div></div>
					</li>
				</ul>
			</div>
		</div>
		<ul class="item-list abs-list">
		</ul>
	</div>
	 <%@ include file="../../inc/adminFooter.jsp" %>
</div>
</div>
</body>
</html>