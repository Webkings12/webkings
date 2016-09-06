<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/board.css"/>
<style type="text/css">
	
</style>
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
		<div class="firstDiv">
			<span class="sp1">제목</span> <span>${vo.bTitle }</span>
		</div>
		<div>
			<span class="sp1">작성자</span> <span>${vo.mEmail }</span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span>${vo.bRegdate }</span>
		</div>
		<div>
			<span class="sp1">조회수</span> <span>${vo.bReadcount }</span>
		</div>
		<c:if test="${!empty vo.bFilename}">
		<div>
			<span class="sp1">이미지</span> <span><img alt="${vo.mImage }" src="<c:url value='/fBoardImages/${vo.bFilename }' />"></span>
		</div>
		</c:if>
		<div class="align_left ">			
			<pre class="boardContent">${vo.bContent }</pre>
		</div>
		<div class="align_right">
			<c:if test="${sessionScope.mNo==vo.mNo }">
			<a href='<c:url value="/freeboard/edit.do?no=${vo.bNo}"/>'>수정</a> |
        	<a id="sendDel" href='#'>삭제</a> |
        	</c:if>
        	<a href='<c:url value="/freeboard/listView.do"/>'>목록</a>			
		</div>
	</div>
	<c:import url="/freeboard/list.do"></c:import>