<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/qna.css"/>

<script type="text/javascript">
	$(document).ready(function(){
		$("#frmQna").submit(function(){
			if($("#qTitle").val().length<1){
				alert("제목을 입력하세요");
				$("#qTitle").focus();
				return false
			}else if($("#qContent").val().length<1){
				alert("내용을 입력하세요");
				$("#qContent").focus();
				return false
			}else if(!$("#agree-1").is(":checked")){
				alert("약관에 동의하셔야합니다");
				$("#agree-1").focus();
				return false
			
			}
			
			if(!validate_hp($("#qTel").val()) ){
				alert("휴대폰번호는 숫자여야 합니다");
				$("#qTel").focus();
				return false;
			}
		});
		
	});
	
	function validate_hp(hp){
		var pattern= new RegExp(/^[0-9--]*$/g);
		return pattern.test(hp);
		/*
		/^[0-9]*$/g
		0~에서 9 사이의 숫자로 시작하거나 끝난다는 의미
		(^ 시작, $ 끝을 의미)
		닫기 대괄호(]) 뒤의 * 기호는 이 패턴이 0번 그 이상 반복된다는 의미
		*/
	}
</script>
<div class="divFrm1" style="text-align: center">
	<form id="frmQna" name="frmQna" method="post" action="<c:url value='/qna/write.do' />" >
		<ul id="list">
			<li><input name="qTitle" type="text" id="qTitle" placeholder="제목"></li>
			<li><textarea name="qContent" id="qContent"  placeholder="문의내용"></textarea></li>
		</ul>
		<ul id="list">
			<li><input name="qTel" type="text" id="qTel"  placeholder="tel"></li>
		</ul>



				
		<br>
		<div class="agree">
			<input type="checkbox" id="agree-1">
			<label for="agree-1">개인정보 취급방침</label>
	    	<iframe class="div1" src="<c:url value='/common/personal.html'/>"></iframe>
		</div>
		<input type="submit" class="btn_default btn_light back_color" id="btQsubMit" value="문의 보내기">
	</form>
</div>
</body>
</html>