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
<form name="fmReply" method="post" action="<c:url value='/reply/write.do'/>" id="fmReply">
	 <fieldset>
	 	<div>
            <input type="hidden"  name="bNo" value="${vo.bNo }"  />
            <textarea name="rContent" id="rContent" rows="3" cols="95"></textarea></span>
            <a class="btn_default btReply" href="#" id="btnReply">등록</a>
	 	</div>
	 </fieldset>
 </form>

 