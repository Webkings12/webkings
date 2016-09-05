<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clear.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/top_m.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/top_f.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/body.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="F">
	<div class="header">
		<div class="shadow">
			<div>
				<div class="in-sec">
					<h1><a href="<c:url value='/main.do'/>">WEBKINGS</a></h1>
					<a href="#" class="gender f">여성</a>
					<a href="#" class="gender m">남성</a>
					<ul class="gnb">
						<li class="active">
							<input type="hidden" id="gnbPage" value="/product">
							<a href="#">ITEM</a>
							<div class="depth2 sec2">
								<dl class="age-sel">
									<dt>추천신상품</dt>
									<dd>
										<a href="#">
											<em>전체연령대</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>10대신상품</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>20대신상품</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>30대신상품</em>
										</a>
									</dd>
								</dl>
								<dl class="item-sel">
									<dt>전체상품</dt>
									<dd>
										<a href="#">
											<em>ALL</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>OUTER</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>TOP</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>BOTTOM</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>SHOES</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>BAG</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>ACC/ETC</em>
										</a>
									</dd>
								</dl>
								<div class="bg"></div>
							</div>
						</li>
						<li class="">
							<input type="hidden" id="gnbPage" value="/shop">
							<a href="#">SHOP</a>
							<div class="depth2">
								<dl class="shop-sel">
									<dt>스타일전체</dt>
									<dd>
										<a href="#">
											<em>쇼핑몰전체</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em>트랜드</em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em></em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em></em>
										</a>
									</dd>
									<dd>
										<a href="#">
											<em></em>
										</a>
									</dd>
								</dl>
								<div class="bg"></div>
							</div>
						</li>
						<li class="">
							<input type="hidden" id="gnbPage" value="/info">
							<a href="#">INFO</a>
						</li>
						<li class="">
							<input type="hidden" id="gnbPage" value="/mypage">
							<a href="#">
								MY
								<!-- ::after -->
							</a>
						</li>
					</ul>
					<%-- <c:if test=""> 세션이 있으면 --%>
						<ul class="logout">
						<c:if test="${empty sessionScope.mEmail }">
							<li><a href="<c:url value='/member/login.do'/>">로그인</a></li>
							<li><a href="<c:url value='/member/tos.do'/>">회원가입</a></li>
						</c:if>					
						<c:if test="${!empty sessionScope.mEmail }">
							<li><a href="<c:url value='/member/logout.do'/>">로그아웃</a></li>
						</c:if>
						</ul>
					<%-- </c:if> --%>
					<%-- <c:if test="">  세션이 없으면 
						<div class="logout">
							<p><img alt="회원사진이미지" src="#">
								::after
							</p>
						</div>
					</c:if> --%>
					<div class="search">
						<form id="fmSearch" name="fmSearch" action="#" class="autoValidateForm"><p>
							<input type="text" name="q" value="" fieldname="검색어" checkfunctionname="checkSpecialChar"
							 restrictutf8bytes="45" class="__required" confirmmessage="특수문자로 검색하실수 없습니다." 
							 autocomplete="off" focus="off"/></p>
						</form>
						<!-- <div class="keyword"></div> 검색어 저장기능 사용시-->
					</div>
				</div>
			</div>
		</div>
		<div class="bg"></div>
	</div>