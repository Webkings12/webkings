<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/board.css"/>
<style type="text/css">
</style>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script src="<c:url value='/ckeditor/ckeditor.js' />" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		CKEDITOR.replace('bContent',{
			skin:'moonocolor'
		});
		var instance = CKEDITOR.instances.bContent;
		instance.updateElement();
		CKEDITOR.config.height = 500;
		
		$("#write_form").submit(function(event){
			if($("#bTitle").val()==""){
				alert("제목을 입력하세요");
				$("#bTitle").focus();
				event.preventDefault();
			}else if(instance.getData() == ""){
	            alert("내용을 입력하세요");
	            $("#bContent").focus();
	            return false;
	         }
			/* else if($("#bContent").val().length<1){
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
			$("#write_form").submit();
		});
	});
</script>


<div class="divFrm2 topMargin">
		
	<form id="write_form" method="post" name="write_form" action="<c:url value='/freeboard/write.do'/>" enctype="multipart/form-data" >

		<div class="align_center bTitle">
			<strong>제목</strong>	<input type="text" id="bTitle" name="bTitle" class="top_Padding" value=""><strong>45</strong>자 제한
		</div>
		<div class="divContent">
			<textarea  name="bContent" id="bContent"></textarea>
		</div>
		<div>
			<input type="file" name="upfile" accept=".jpg,.png,.gif">
		</div>	
		<br>			
		<div class="btn">
			<a id="btSubmit" class="btn_default btn_light btn_large btn_BaW" href="#">등록</a>
			<a class="btn_default btn_light btn_large" href='<c:url value="/freeboard/listView.do"/>' >글목록</a>
		</div>
	</form>

	</div>