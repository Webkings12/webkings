<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../../../inc/adminTop.jsp" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/board.css"/>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<style type="text/css">
	.divFrm2{
		margin: 0 auto;
		margin-top: 200px;
		width: 600px;
		text-align: center;
	}
	
	.content{
		border: 1px solid lightgray;
		background: white;
		padding: 15px;
	}
	
	.align_left{
		text-align: left;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#sendDel").click(function(){
			if(confirm("삭제하시겠습니까?")){
				$(location).attr('href', '<c:url value="/admin/qna/delete.do?qNo=${vo.qNo}" />');
					
			}
		})
	});
</script>
<!--  -->
<div class="divList2 topMargin">
			<div clss="upsideDetail" style="background: #fff;height:165px; border: 1px solid #CECECE;" >
				<div class="detailTitle">
					<span>
						<c:if test="${fn:length(vo.qTitle)>45 }">
				 			${fn:substring(vo.bTitle,0,45) }...
				 		</c:if>
				 		<c:if test="${fn:length(vo.qTitle)<=45 }">
				 			${vo.qTitle}
				 		</c:if>	
					</span>
				</div>
				<div>
					<div class="float_left">
						<!-- 유저 이미지 -->
						<c:if test="${empty vo.mImage }">
						<img class="user_Img" src="<c:url value='/user_images/defaultUser.png'/>">
						</c:if>
						<c:if test="${!empty vo.mImage }">
						<img class="user_Img" src="<c:url value='/user_images/${vo.mImage }'/>">
						</c:if>
					</div>
					<div class="float_left user_info topPadding">
					 <span class="nickName">${vo.mNick }</span><br><span class="eMail">(${vo.mEmail })</span><br>
					  <a class="btn_light" href="<c:url value='/qna/list.do?searchKeyword=${vo.mEmail }&searchCondition=m_Email'/>">작성글보기</a><br>
					 <span class="sp1">작성일</span> <span><fmt:formatDate value="${vo.qRegdate }" pattern="yyyy-MM-dd(mm:ss)"/></span>
					 </div>
				</div>
			</div>
		<div class="align_left">			
			<pre class="boardContent">${vo.qContent }</pre>
		</div>
		<div>
			 <div class="float_left">
				<c:if test="${nextNo!=vo.qNo }">
					<a href="<c:url value='/admin/qna/detail.do?no=${nextNo }' />"> 윗글 </a>
				</c:if> &nbsp; | &nbsp; 
				<c:if test="${beforeNo!=vo.qNo }">
					<a href="<c:url value='/admin/qna/detail.do?no=${beforeNo }' />">아랫글 </a>
				</c:if>
			</div> 
			<div class="float_right">
				<a class="btn_default btn_light size_S"  href='<c:url value="/admin/qna/edit.do?qNo=${vo.qNo}"/>'>수정</a> |
	        	<a class="btn_default btn_light size_S" id="sendDel" href='#'>삭제</a> |
	        	<a class="btn_default btn_light size_S" href='<c:url value="/admin/qna/list.do"/>'>목록</a>			
			</div>
			<div class="float_clear"></div>
		</div>
	</div>
	<div class="divReply">
		<%-- <c:import url="/admin/qnaReply/list.do?qNo=${vo.qNo }"></c:import> --%>
	</div> 
	<div class="divReply">
		<%-- <%@include file="replyWrite.jsp" %> --%>
	</div>
<!--  -------------------------------------------------------------------------------------------------->
	<c:import url="/admin/qna/listView.do"></c:import>
	

