<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../inc/top.jsp" %>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript" src="<c:url value='/js/mainF.js'/>"></script>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/board.css"/>


<script type="text/javascript">
	$(document).ready(function(){
		$("#sendDel").click(function(){
			if(confirm("삭제하시겠습니까?")){
				$(location).attr('href', '<c:url value="/freeboard/delete.do?bNo=${vo.bNo}" />');
					
			}
		})
	});
</script>

	<div class="divList2 topMargin">
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
						<img class="user_Img" src="<c:url value='/user_images/defaultUser.png'/>">
						</c:if>
						<c:if test="${!empty vo.mImage }">
						<img class="user_Img" src="<c:url value='/user_images/${vo.mImage }'/>">
						</c:if>
					</div>
					<div class="float_left user_info">
					 <span class="nickName">${vo.mNick }</span><br><span class="eMail">(${vo.mEmail })</span><br>
					 <a class="btn_light" href="<c:url value='/freeboard/list.do?searchKeyword=${vo.mEmail }&searchCondition=m.m_Email'/>">작성글보기</a><br>
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
					<a href="<c:url value='/freeboard/detail.do?no=${nextNo }'/>"> 윗글 </a>
				</c:if> &nbsp; | &nbsp; 
				<c:if test="${beforeNo!=vo.bNo }">
					<a href="<c:url value='/freeboard/detail.do?no=${beforeNo }'/>">아랫글 </a>
				</c:if>
			</div>
			<div class="float_right">
				<c:if test="${sessionScope.mNo==vo.mNo }">
					<a class="btn_default btn_light size_S"  href='<c:url value="/freeboard/edit.do?no=${vo.bNo}"/>'>수정</a> |
		        	<a class="btn_default btn_light size_S" id="sendDel" href='#'>삭제</a> |
	        	</c:if>
	        	<a class="btn_default btn_light size_S" href='<c:url value="/freeboard/list.do"/>'>목록</a>			
			</div>
			<div class="float_clear"></div>
		</div>
	</div>
	<div class="divReply">
		<c:import url="/reply/list.do?bNo=${vo.bNo }"></c:import>
	</div>
	<div class="divReply">
		<%@include file="../reply/replyWrite.jsp" %>
	</div> 
		<c:import url="/freeboard/listView.do"></c:import>
</body>
</html>