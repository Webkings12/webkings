<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
	<!-- left -->
	<div class="tbtnSec">
		<div class="inSec">
			<c:if test="${empty sessionScope.cEmail }">
			<a href="javascript:;" class="sys-btn sys-btn-type4">
				<span>로그인</span>
			</a>
				</c:if>
				<c:if test="${!empty sessionScope.cEmail }">
				<a href='javascript:;' class="sys-btn sys-btn-type4" onclick="logout()">
					<span>로그아웃</span>
				</a>
				</c:if>
			<a href="<c:url value='/chief/addChief.do'/>" class="sys-btn sys-btn-type4">
				<span>회원가입</span>
			</a>
		</div>
	</div>
	<div class="lnbSec">
		<ul>
			<li>
				<a class="146">
					<em><i>1</i></em>
					<strong>비즈머니</strong>
				</a>
				<dl>
					<dd>
						<a>비즈머니 충전</a>
						<a>비즈머니/포인트 내역</a>
						<a>환불내역</a>
						<a>결제내역</a>
						<a>결제내역(구)</a>
						<a>세금계산서</a>
					</dd>
				</dl>
				<a>
					<em><i>2</i></em>
					<strong>쇼핑묠&상품관리</strong>
				</a>
				<dl>
					<dd>
						<a>쇼핑몰정보관리</a>
						<a>상품관리</a>
					</dd>
				</dl>
				<a>
					<em><i>3</i></em>
					<strong>광고관리</strong>
				</a>
				<dl>
					<dd>
						<a>CPC광고 관리</a>
						<a>CPS광고 관리</a>
						<a>쿠폰광고 관리</a>
						<a>과금제한 설정</a>
					</dd>
				</dl>
				<a>
					<em><i>4</i></em>
					<strong>광고성과분석</strong>
				</a>
				<dl>
					<dd>
						<a>CPC광고 성과</a>
						<a>CPS광고 성과</a>
						<a>쿠폰광고 성과</a>
						<a>주문 데이터조회</a>
					</dd>
				</dl>
				<a>
					<em><i>5</i></em>
					<strong>이력관리</strong>
				</a>
				<a>
					<em><i>6</i></em>
					<strong>고객센터</strong>
				</a>
				<dl>
					<dd>
						<a>공지사항</a>
						<a>1:1문의</a>
						<a>자주묻는 질문</a>>
					</dd>
				</dl>
			</li>
		</ul>
	</div>
	<div class="txt1">
		<strong></strong>
	</div>
	<div class="txt2">
		<strong></strong>
	</div>
</body>
