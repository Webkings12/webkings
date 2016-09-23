<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
	
	
 	/* $(document).ready(function(){
 		
		/* var res="#rereply"+$("#replyNo").val();
		$(res).click(function(){
			alert(res);
			var res2="#toggle"+$("#replyNo").val();
			//alert(res2);
			$(res2).toggle();
		}); 
	}); */
	
	function reToggle(rNo){
		
		var res="toggle"+rNo;
		
		obj=document.getElementById(res);
		if(obj.style.display=="none"){
			obj.style.display="inline";
		}else{
			obj.style.display="none";
		}
	}
	
	function replySend(rNo){
		var res2="rereplyWrite"+rNo;
		var res3="rerContent"+rNo;
		obj=document.getElementById(res2);
		obj2=document.getElementById(res3);
		if(obj2.value.length<1){
			return;
		}
		
		obj.submit();
		/* var res2="rereplyWrite"+rNo;
		alert(res2+"왜안돼냐?");
		document.res2.submit(); */
	}
	
</script>
<table class="replyList"
	 	summary="기본 게시판에 관한 표로써, 번호, 제목, 작성자, 작성일, 조회수에 대한 정보를 제공합니다.">
	<colgroup>
		<col style="width:15%;" />
		<col style="width:65%;" />
		<col style="width:10%;" />
	</colgroup>
	<tbody>  
	  <!--게시판 내용 반복문 시작  -->
	<c:if test="${!empty qrList }">
	<c:forEach var="qrVo" items="${qrList }">
	
		<c:if test="${qrVo.qrGbn==0 }">
			<tr style="text-align: center">
		 		<td>${qrVo.mEmail }</td>
		 		<td>
		 			<span>${qrVo.qrContent}</span>
		 			<a id="rereply${qrVo.qrNo }" onclick="reToggle(${qrVo.qrNo })" style="font-size: 0.8em;color: #CC66FF;" >-답글</a>
		 			<div style="display: none;" id="toggle${qrVo.qrNo }" style="margin-top: 15px">
		 			
		 				<form action="<c:url value='/admin/qnaReply/write2.do'/>" name="rereplyWrite${qrVo.qrNo }" id="rereplyWrite${qrVo.qrNo }" method="post">
		 					<input type="hidden"  name="qrGbn" value="${qrVo.qrGbn }"  />
		 					<input type="hidden"  name="qrNoGroup" value="${qrVo.qrNoGroup }"  />
		 					<input type="hidden"  name="qNo" value="${qrVo.qNo }"  />
            				<textarea class="rContent" name="qrContent" id="rerContent${qrVo.qrNo }" rows="1" cols="70"></textarea></span>
           					 <input type="button" class="btn_default btReReply" id="btReply" onclick="replySend(${qrVo.qrNo })" value="등록">
		 				</form>
		 				
		 			</div>
		 			
		 		</td>
		 		<td>
		 			<fmt:formatDate value="${qrVo.qrRegdate }" pattern="yyyy-MM-dd"/>
		 				<a id="replyDel" href="<c:url value='/admin/qnaReply/delete.do?qrNo=${qrVo.qrNo }&qNo=${qrVo.qNo }'/>">X</a>
		 		</td>
		 	</tr>
		 </c:if>
		 <c:if test="${qrVo.qrGbn>0 }">
		 	<tr style="text-align: center;">
		 		<td><span style="font-size: 0.8em;color:#CC66FF ">└</span>${qrVo.mEmail }</td>
		 		<td colspan="2" class="gbnReply" style="padding-left: 15px;">
		 			<span >${qrVo.qrContent}</span>
		 			<a id="rereply${qrVo.qrNo }"  onclick="reToggle(${qrVo.qrNo })" style="font-size: 0.8em;color: #CC66FF;" >-답글</a>
		 			<span class="dateSpan">
		 			|<fmt:formatDate value="${qrVo.qrRegdate }" pattern="yyyy-MM-dd"/>
		 				<a id="replyDel" href="<c:url value='/admin/qnaReply/delete.do?qrNo=${qrVo.qrNo }&qNo=${qrVo.qNo }'/>">X</a>
		 			</span>
		 			<div style="display: none;" id="toggle${qrVo.qrNo }" style="margin-top: 15px">
		 			
		 				<form action="<c:url value='/admin/qnaReply/write2.do'/>" name="rereplyWrite${qrVo.qrNo }" id="rereplyWrite${qrVo.qrNo }" method="post">
		 					<input type="hidden"  name="qrGbn" value="${qrVo.qrGbn }"  />
		 					<input type="hidden"  name="qrNoGroup" value="${qrVo.qrNoGroup }"  />
		 					<input type="hidden"  name="qNo" value="${qrVo.qNo }"  />
            				<textarea class="rContent" name="qrContent" id="rerContent${qrVo.qrNo }" rows="1" cols="70"></textarea></span>
           					 <input type="button" class="btn_default btReReply" id="btReply" onclick="replySend(${qrVo.qrNo })" value="등록">
		 				</form>
		 				
		 			</div>
		 			
		 		</td>
		 	</tr>
		 </c:if>		
	</c:forEach>
	  <!--반복처리 끝  -->
	</c:if>
	  </tbody>
</table>	 