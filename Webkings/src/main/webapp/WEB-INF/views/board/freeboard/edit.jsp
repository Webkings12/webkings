<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#frmWrite").submit(function(event){
			if($("#title").val()==""){
				alert("제목을 입력하세요");
				$('#title').focus();
				event.preventDefault();
			}
		});
	});
	
	window.onload=function(){
		
	};
</script>
<style type="text/css">
	.divFrm2{
		margin: 0 auto;
		margin-top: 200px;
		width: 600px;
		text-align: center;
	}

.btn_default.btn_light {
    padding: 0;
}
.btn_default {
    display: inline-block;
    height: 40px;
    line-height: 40px;
    text-align: center;
    width: 150px;
    font-weight: 700;
    cursor: pointer;
    -webkit-box-shadow: 0 3px 10px -3px #aaa;
    -moz-box-shadow: 0 3px 10px -3px #aaa;
    box-shadow: 0 3px 10px -3px #aaa;
}
.btn_large {
    padding: 10px 40px;
    font-size: 20px;
}
.btn_light {
    padding: 4px 9px;
    color: #666;
    border: 1px solid #ccc;
    background-color: #fff;
    font-weight: 700;
    cursor: pointer;
    text-align: center;
    display: inline-block;
}
.btn_BaW {
	
    /* background-color: #1A70DC; */
    background-color: #FF00CC;
}


.divFrm2 input[type=text] {
    height: 40px;
    border: 1px solid #e4e6e9;
    text-indent: 12px;
    width: 88%;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    padding-top: 0;
}

.divFrm2 textarea {
    border: 1px solid #e4e6e9;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    line-height: 140%;
    width: 100%;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    padding: 12px;
    height: 300px;
    
}
.float_left{
	float: left;
}
.align_center{
	text-align: center;
	margin: 0 auto;
}
.btn .btn_BaW {
	color: #FFFFFF;
}
.top_Padding{
	padding-top: 10px;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btSubmit").click(function(){
			$("#edit_form").submit();
		});
	});
</script>


<div class="divFrm2">
		
	<form id="edit_form" method="post" name="edit_form" action="<c:url value='/freeboard/edit.do'/>" enctype="multipart/form-data" >
			<input type="hidden" name="bNo" value="${vo.bNo}">
		<input type="hidden" name="oldFilename" value="${vo.bFilename}">
		<input type="hidden" name="oldOriginfilename" value="${vo.bOriginalfilename}">
		<input type="hidden" name="oldFilesize" value="${vo.bFilesize}">
		
		
		<div class="align_center">
			<h4 class="float_left top_Padding"><strong>제목</strong></h4>
			<input type="text" id="subject" name="bTitle" class="float_left top_Padding" value="${vo.bTitle }">
			<div class="float_left top_Padding"><strong>45</strong>자 제한</div>
		</div>
		<br>
		<br>
		<div class="divContent">
			<textarea name="bContent">${vo.bContent }</textarea>
		</div>
		<div>
			<input type="file" name="upfile">
			<c:if test="${!empty vo.bFilename }">
         		<p style="color:green;">
         			※첨부파일을 새로 지정할 경우 기존파일
         			<img src="<c:url value='/images/file.gif'/>" alt="파일이미지">${vo.bOriginalfilename } 은삭제됩니다.
         		</p>
         	</c:if>
		</div>	
		<br>			
		<div class="btn">
			<a id="btSubmit" class="btn_default btn_light btn_large btn_BaW" href="#">수정</a>
			<a class="btn_default btn_light btn_large" href="<c:url value='/freeboard/detail.do?no=${vo.bNo}'/>" >취소</a>
		</div>
	</form>

	</div>