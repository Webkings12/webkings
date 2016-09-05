<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member.css"/>
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>

<script type="text/javascript">
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#UploadedImg').attr('src', e.target.result);
            $('#UploadedImg').css({"width":"80px"},{"height":"80px"});
            $('#UploadedImg').css("border-radius","40px");
        }
        reader.readAsDataURL(input.files[0]);
    }
}

$(document).ready(function(){
	$("#form").submit(function(event){
		if($("#mEmail").val().length<1){
			alert("이메일을 입력하세요.");
			$("#id01").css("display","block");
			$("#mEmail").focus();
			return false;
		}else if($("#mNick").val().length<1){
			alert("닉네임을 입력하세요.");
			$("#id01").css("display","block");
			$("#mNick").focus();
			return false;
		}else if($("#mPwd").val().length<1){
			alert("비밀번호를 입력하세요.");
			$("#id01").css("display","block");
			$("#mPwd").focus();
			return false;
		}else if($("#mPwd_ok").val().length<1){
			alert("비밀번호확인을 입력하세요.");
			$("#id01").css("display","block");
			$("#mPwd_ok").focus();
			return false;
		}else if($("#mPwd").val()!= $("#mPwd_ok").val()){
			alert("비밀번호가 다릅니다.");
			$("#id01").css("display","block");
			$("#mPwd_ok").focus();
			return false;
		}
		
		$("#id01").css("display","none");
		
	});
});
</script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member.css" />

<div id="id01" class="modal">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
	<div class="amodel">
  <form id="form" class="modal-content animate"
  action="<c:url value="/member/register.do"/>" method="post" enctype="multipart/form-data" >
    <div class="reg">
    <div class="imgfile">
       <img id="UploadedImg" 
       src="" /> 
    </div>
    <div>
		<input type='file' name="upFile" onchange="readURL(this)"/>
    </div>
    </div>
   
    <div class="container1">
    	<div class="reg">
      		<input type="text" placeholder="이메일" name="mEmail" id="mEmail">
    	</div>
    	<div class="reg"> 
      		<input type="text" placeholder="닉네임" name="mNick" id="mNick">
   		</div>
		<div class="reg">
      		<input type="password" placeholder="비밀번호" name="mPwd" id="mPwd">
      	</div>
    	<div class="reg">  
      		<input type="password" placeholder="비밀번호확인" name="mPwd_ok" id="mPwd_ok">
    	</div>
    </div>
	

    <div class="container" style="background-color:#f1f1f1">
      <input  type="submit" class="cancelbtn" value="회원가입" />
    </div>
  </form>
</div>
</div>

