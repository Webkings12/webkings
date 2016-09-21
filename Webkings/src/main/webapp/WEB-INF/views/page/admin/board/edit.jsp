<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../../../inc/adminTop.jsp" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/board.css"/>
<script src="<c:url value='/ckeditor/ckeditor.js' />" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		CKEDITOR.replace('bContent');
		var instance = CKEDITOR.instances.bContent;
		instance.updateElement();
		CKEDITOR.config.height = 500;
		


		$("#edit_form").submit(function(event){
			if($("#bTitle").val()==""){
				alert("제목을 입력하세요");
				$("#bTitle").focus();
				event.preventDefault();
			}else if(instance.getData() == ""){
	            alert("내용을 입력하세요");
	            $("#bContent").focus();
	            return false;
	         }
			
			/* else if($("#bContent").val()==''){
				alert("내용을 입력하세요");
				$("#bContent").focus();
				event.preventDefault();
			} */
			if($("#bTitle").val().length>45){
				alert("제목이 너무 깁니다");
				$('#bTitle').focus();
				event.preventDefault();
			}
		});
		$("#btSubmit").click(function(){
			$("#edit_form").submit();
		});
	});
</script>


<div class="divFrm2 topMargin bottomMargin">
		
	<form id="edit_form" method="post" name="edit_form" action="<c:url value='/admin/freeboard/edit.do'/>" enctype="multipart/form-data" >
			<input type="hidden" name="bNo" value="${vo.bNo}">
		<input type="hidden" name="oldFilename" value="${vo.bFilename}">
		<input type="hidden" name="oldOriginfilename" value="${vo.bOriginalfilename}">
		<input type="hidden" name="oldFilesize" value="${vo.bFilesize}">
		
		
		<div class="align_center bTitle">
			<strong>제목</strong><input type="text" id="bTitle" name="bTitle" class="top_Padding" value="${vo.bTitle }"><strong>45</strong>자 제한
		</div>
		<div class="divContent">
			<textarea id="bContent" name="bContent">${vo.bContent }</textarea>
		</div>
		<div>
			<input type="file" name="upfile" accept=".jpg,.png,.gif">
			<c:if test="${!empty vo.bFilename }">
         		<p style="color:green;">
         			※첨부파일을 새로 지정할 경우 기존파일
         			<img src="<c:url value='/images/file.gif'/>" alt="파일이미지" >${vo.bOriginalfilename } 은삭제됩니다.
         		</p>
         	</c:if>
		</div>	
		<br>			
		<div class="btn">
			<a id="btSubmit" class="btn_default btn_light btn_large btn_BaW" href="#">수정</a>
			<a class="btn_default btn_light btn_large" href="<c:url value='/admin/freeboard/detail.do?no=${vo.bNo}'/>" >취소</a>
		</div>
	</form>

	</div>
	
<%@ include file="../../../inc/adminFooter.jsp" %>