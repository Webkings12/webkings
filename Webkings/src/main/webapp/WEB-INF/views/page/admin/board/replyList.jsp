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
	<c:if test="${!empty rList }">
	<c:forEach var="rVo" items="${rList }">
	
		<c:if test="${rVo.rGbn==0 }">
			<tr style="text-align: center">
		 		<td>${rVo.mEmail }</td>
		 		<td>
		 			<span>${rVo.rContent}</span>
		 			<a id="rereply${rVo.rNo }" onclick="reToggle(${rVo.rNo })" style="font-size: 0.8em;color: #CC66FF;" >-답글</a>
		 			<div style="display: none;" id="toggle${rVo.rNo }" style="margin-top: 15px">
		 			
		 				<form action="<c:url value='/admin/reply/write2.do'/>" name="rereplyWrite${rVo.rNo }" id="rereplyWrite${rVo.rNo }" method="post">
		 					<input type="hidden"  name="rGbn" value="${rVo.rGbn }"  />
		 					<input type="hidden"  name="rNoGroup" value="${rVo.rNoGroup }"  />
		 					<input type="hidden"  name="bNo" value="${rVo.bNo }"  />
            				<textarea class="rContent" name="rContent" id="rerContent${rVo.rNo }" rows="1" cols="70"></textarea></span>
           					 <input type="button" class="btn_default btReReply" id="btReply" onclick="replySend(${rVo.rNo })" value="등록">
		 				</form>
		 				
		 			</div>
		 			
		 		</td>
		 		<td>
		 			<fmt:formatDate value="${rVo.rRegdate }" pattern="yyyy-MM-dd"/>
		 				<a id="replyDel" href="<c:url value='/admin/reply/delete.do?rNo=${rVo.rNo }&bNo=${rVo.bNo }'/>">X</a>
		 		</td>
		 	</tr>
		 </c:if>
		 <c:if test="${rVo.rGbn>0 }">
		 	<tr style="text-align: center;">
		 		<td><span style="font-size: 0.8em;color:#CC66FF ">└</span>${rVo.mEmail }</td>
		 		<td colspan="2" class="gbnReply" style="padding-left: 15px;">
		 			<span >${rVo.rContent}</span>
		 			<a id="rereply${rVo.rNo }"  onclick="reToggle(${rVo.rNo })" style="font-size: 0.8em;color: #CC66FF;" >-답글</a>
		 			<span class="dateSpan">
		 			|<fmt:formatDate value="${rVo.rRegdate }" pattern="yyyy-MM-dd"/>
		 				<a id="replyDel" href="<c:url value='/admin/reply/delete.do?rNo=${rVo.rNo }&bNo=${rVo.bNo }'/>">X</a>
		 			</span>
		 			<div style="display: none;" id="toggle${rVo.rNo }" style="margin-top: 15px">
		 			
		 				<form action="<c:url value='/admin/reply/write2.do'/>" name="rereplyWrite${rVo.rNo }" id="rereplyWrite${rVo.rNo }" method="post">
		 					<input type="hidden"  name="rGbn" value="${rVo.rGbn }"  />
		 					<input type="hidden"  name="rNoGroup" value="${rVo.rNoGroup }"  />
		 					<input type="hidden"  name="bNo" value="${rVo.bNo }"  />
            				<textarea class="rContent" name="rContent" id="rerContent${rVo.rNo }" rows="1" cols="70"></textarea></span>
           					 <input type="button" class="btn_default btReReply" id="btReply" onclick="replySend(${rVo.rNo })" value="등록">
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