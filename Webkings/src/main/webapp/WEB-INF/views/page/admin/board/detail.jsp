<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../../../inc/adminTop.jsp" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/board.css"/>


<script type="text/javascript">
	$(document).ready(function(){
		$("#sendDel").click(function(){
			if(confirm("삭제하시겠습니까?")){
				$(location).attr('href', '<c:url value="/admin/freeboard/delete.do?bNo=${vo.bNo}&bFilename=${vo.bFilename}" />');
					
			}
		})
	});
</script>

	<div class="divList2 topMargin" style="padding-bottom: 150px;">
			<div clss="upsideDetail" style="background: #fff;height:165px; border: 1px solid #CECECE;" >
				<div class="detailTitle">
					<span>
						<c:if test="${fn:length(vo.bTitle)>45 }">
				 			${fn:substring(vo.bTitle,0,45) }...
				 		</c:if>
				 		<c:if test="${fn:length(vo.bTitle)<=45 }">
				 			${vo.bTitle}
				 		</c:if>	
					</span>
				</div>
				<div>
					<div class="float_left">
						<!-- 유저 이미지 -->
						<c:if test="${empty vo.mImage }">
						<img class="user_Img" src="<c:url value='/user_images/person-icon.png'/>">
						</c:if>
						<c:if test="${!empty vo.mImage }">
						<img class="user_Img" src="<c:url value='/user_images/${vo.mImage }'/>">
						</c:if>
					</div>
					<div class="float_left user_info">
					 <span class="nickName">${vo.mNick }</span><br><span class="eMail">(${vo.mEmail })</span><br>
					 <a class="btn_light" href="<c:url value='/admin/freeboard/list.do?searchKeyword=${vo.mEmail }&searchCondition=m.m_Email&gender=${gender }'/>">작성글보기</a><br>
					 <span>작성일:</span> <span><fmt:formatDate value="${vo.bRegdate }" pattern="yyyy-MM-dd(HH:mm)"/></span><br>
					 <span>조회수:</span> <span>${vo.bReadcount }</span>
					 </div>
				</div>
			</div>
		<c:if test="${!empty vo.bFilename}">
		<div>
			<img class="boardImage" alt="${vo.bFilename }" src="<c:url value='/fBoardImages/${vo.bFilename }' />"></span>
		</div>
		</c:if>
		<div>		
				
			<pre class="boardContent">${vo.bContent }</pre>
		</div>
		<div>
			<div class="float_left">
				<c:if test="${nextNo!=vo.bNo }">
					<a href="<c:url value='/admin/freeboard/detail.do?no=${nextNo }&gender=${gender }'/>"> 윗글 </a>
				</c:if> &nbsp; | &nbsp; 
				<c:if test="${beforeNo!=vo.bNo }">
					<a href="<c:url value='/admin/freeboard/detail.do?no=${beforeNo }&gender=${gender }'/>">아랫글 </a>
				</c:if>
			</div>
			<div class="float_right">
					<a class="btn_default btn_light size_S"  href='<c:url value="/admin/freeboard/edit.do?no=${vo.bNo}&gender=${gender }"/>'>수정</a> |
		        	<a class="btn_default btn_light size_S" id="sendDel" href='#'>삭제</a> |
	        	<a class="btn_default btn_light size_S" href='<c:url value="/admin/freeboard/list.do?gende=${gender }"/>'>목록</a>			
			</div>
			<div class="float_clear"></div>
		</div>
	
	<div class="divReply">
		<c:import url="/admin/reply/list.do?bNo=${vo.bNo }"></c:import>
	</div>
	<div class="divReply">
		<%@include file="replyWrite.jsp" %>
	</div> 
		<c:import url="/admin/freeboard/listView.do"></c:import>

	
	
	</div>
<%@ include file="../../../inc/adminFooter.jsp" %>	