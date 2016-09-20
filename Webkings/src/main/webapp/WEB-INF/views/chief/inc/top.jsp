<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/chief/skin.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/chief/base.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Marketing center</title>
</head>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<body>
	<!-- header -->
	<div class="headSec">
		<h1>
			<a href="<c:url value='/chief/chiefMain.do'/>">
				<img src="${pageContext.request.contextPath}/images/chief/mkcenter.jpg" alt="마케팅센터">
			</a>
		</h1>
		<div class="fleft">
			<div class="icon">
				<a href="javascript:;" class="icon">가이드 페이지</a>
				
				<div class="list">
					<ul class="boxRD5">
						<li>
							<a>제휴문의</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<!-- header 경계선 -->	
	<div class="hspace1"></div>
</body>
</html>