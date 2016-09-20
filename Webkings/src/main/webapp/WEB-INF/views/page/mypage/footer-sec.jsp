<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css"/>
<div class="footer-sec">
	<div>
		<div class="in-sec">
			<div>
		<ul>
			<li><a href="<c:url value='/company.do?gender=${gender}'/>">회사소개</a></li>
			<li><a href="<c:url value='/service.do?gender=${gender}'/>">이용약관</a></li>
			<li><a href="<c:url value='/privacy.do?gender=${gender}'/>">개인정보처리방침</a></li>
			<li><a href="<c:url value='/qna/write.do?gender=${gender}'/>">1:1문의</a></li>
			<li><a href="<c:url value='/chief/chiefMain.do'/>" target="_blank">마케팅센터</a></li>
			<li><a href="/propose">제휴문의</a></li>
		</ul>

		<p class="copyright">COPYRIGHT@2016 BY WEBKINGS.COM.,LTD. ALL RIGHT RESERVED.</p>
</div></div></div></div>
</body>
</html>
