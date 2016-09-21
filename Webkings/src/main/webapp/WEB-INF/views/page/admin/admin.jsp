<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp" %>
<div class="body-sec">
<div class="in-sec">
		<div class="footer">
			<div class="list-top-2">
				<div class="in">
					<div class="tab-type-2">
						<ul>
							<li class="active single"><a href="javascript:;" class="nlink">일반회원 관리자</a></li>
						</ul>
					</div>
				</div>
			</div>
	<div class="in-sec-2">
		<ul class="mypage-btn">
			<li class="login"><a href="<c:url value='/admin/memberList.do'/>">회원 관리</a></li>
			<li class="recent-prod"><a href="javascript:;" onclick="document.getElementById('ItemGenderSel').style.display='block'">상품 관리<em></em></a></li>
			<li class="recent-shop"><a href="javascript:;" onclick="document.getElementById('ShopGenderSel').style.display='block'">샵 관리<em></em></a></li>
			<li class="coupon"><a href="<c:url value='/admin/freeboard/list.do'/>" id="coupon">게시판 관리</a></li>
			<li class="favor"><a href="<c:url value='/admin/qna/list.do'/>" id="coupon">문의관리</a></li>
		</ul>
	</div>
	 <%@ include file="../../inc/adminFooter.jsp" %>
</div>
</div>
</div>
</body>
</html>