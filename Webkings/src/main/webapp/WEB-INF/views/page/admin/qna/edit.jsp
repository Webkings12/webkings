<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../../../inc/adminTop.jsp" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/board.css"/> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/qna.css"/>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>

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
			}else if($("#qTitle").val().length>45){
				alert("제목이 너무 깁니다");
				$("#qTitle").focus();
				return false
			}
			
			
			/* if(!validate_hp($("#qTel").val()) ){
				alert("휴대폰번호는 숫자여야 합니다");
				$("#qTel").focus();
				return false;
			} */
		});
		
	});
	
	function validate_hp(hp){
		var pattern= new RegExp(/^[0-9--]*$/g);
		return pattern.test(hp);
	}
</script>
<div class="divFrm1 topMargin" style="text-align: center">
	<form id="frmQna" name="frmQna" method="post" action="<c:url value='/admin/qna/edit.do' />" >
		<ul id="list">
			<li><input name="qNo" type="hidden"  value="${qVo.qNo }" ></li>
			<li><input name="qTitle" type="text" id="qTitle" value="${qVo.qTitle }"></li>
			<li><textarea name="qContent" id="qContent">${qVo.qContent }</textarea></li>
		</ul>
				
		<br>
		<input type="submit" class="btn_default btn_light back_color" id="btQsubMit" value="수 정">
	</form>
</div>
<%@ include file="../../../inc/adminFooter.jsp" %>	