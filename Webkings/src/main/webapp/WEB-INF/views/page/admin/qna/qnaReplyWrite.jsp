<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(document).ready(function(){
		$("#btnReply").click(function(){
			if($("#rContent").val().length<1){
				return;
			}
			$("#fmReply").submit();
		});
	});
</script>												 
<form name="fmReply" method="post" action="<c:url value='/admin/qnaReply/write.do'/>" id="fmReply">
	 <fieldset>
	 	<div>
            <input type="hidden"  name="qNo" value="${vo.qNo }"  />
            <textarea name="qrContent" id="rContent" rows="3" cols="95"></textarea>
            <a class="btn_default btReply" href="#" id="btnReply">등록</a>
	 	</div>
	 </fieldset>
 </form>

 