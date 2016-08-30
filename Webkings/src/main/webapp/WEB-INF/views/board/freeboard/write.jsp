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
	.divForm{
		margin: 0 auto;
		margin-top: 100px;
		width: 600px;
	}
</style>

<div class="divForm">
<form name="frmWrite" method="post" action="<c:url value='/board/write.do'/>" id="frmWrite">
 <fieldset>
	<legend>글쓰기</legend>
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="title" name="title"  />
        </div>
        <div>
            <label for="name">작성자</label>
            <input type="text" id="name" name="name" />
        </div>
        <div>
            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd" />
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" />
        </div>
        <div>  
        	<label for="content">내용</label>
        </div>
        <div>
			<textarea name="content" id="content" rows="12" cols="60"></textarea>
			<!-- <textarea name="content" rows="12" cols="60" class="ckeditor"></textarea> -->
		</div>
        <div class="center">
            <input type = "submit" value="등록"/>
            <input type = "Button" value="글목록" onclick="location.href='<c:url value="/board/list.do"/>';" />         
        </div>
    </fieldset>
</form>
</div>   