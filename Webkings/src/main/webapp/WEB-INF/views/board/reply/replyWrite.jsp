<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(document).ready(function(){
		$("#btReply").click(function(){
			$("#frmReply").submit();
		});
	});
</script>
<form name="frmReply" method="post" action="<c:url value='/reply/write.do'/>" id="frmReply">
	 <fieldset>
	 	<div>
            <input type="hidden"  name="bNo" value="${vo.bNo }"  />
            <textarea name="rContent" id="rContent" rows="3" cols="95"></textarea></span>
            <a class="btn_default btReply" href="#" id="btReply">등록</a>
	 	</div>
	 </fieldset>
 </form>

 