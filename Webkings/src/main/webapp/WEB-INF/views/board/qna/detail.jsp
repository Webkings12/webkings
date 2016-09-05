<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
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
				$(location).attr('href', '<c:url value="/qna/delete.do?qNo=${vo.qNo}" />');
					
			}
		})
	});
</script>


	<div class="divFrm2">
		<div class="firstDiv">
			<span class="sp1">제목</span> <span>${vo.qTitle }</span>
		</div>
		<div>
			<span class="sp1">작성자</span> <span>${vo.mEmail }</span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span>${vo.qRegdate }</span>
		</div>
		<div class="align_left ">			
			<pre class="content">${vo.qContent }</pre>
		</div>
		<div class="center">
			<a href='<c:url value="/qna/edit.do?no=${vo.qNo}"/>'>수정</a> |
        	<a id="sendDel" href='#'>삭제</a> |
        	<a href='<c:url value="/qna/list.do"/>'>목록</a>			
		</div>
	</div>