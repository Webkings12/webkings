<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member.css"/>
<html>
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#form").submit(function(event){
			if(!$("#tos1").is(":checked")){
				alert("이용약관에 동의하셔야 합니다.");
				$("#id01").css("display","block");
				$("#tos1").focus();
				return false;
			}else if (!$("#tos2").is(":checked")) {
				alert("개인정보취급방침에 동의하셔야 합니다");
				$("#id01").css("display","block");
				$("#tos2").focus();
				return false;
			}
<<<<<<< HEAD
=======
			$("#id01").css("display","none");
>>>>>>> branch 'master' of https://github.com/Webkings12/webkings.git
		});
	});
</script>	
<style>

</style>
<body>

<div id="id01" class="modal">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
  <form id="form" class="modal-content animate" method="get" 
  action="<c:url value='/member/register.do'/>">
<div class="modal1">
    <div class="imgcontainer">
      <h2>약관동의</h2>
      <hr>
    </div>
  
    <div class="tos">
    	<label for="tos1">이용약관</label>
    	<input type="checkbox" id="tos1" name="tos1" class="toss">
    	<div>
    		<iframe class="iframe" src="
    		<c:url value='/common/provision.html'/>"></iframe>
    	</div>
    </div>
    <div class="tos">
    	<label for="tos2">개인정보취급방침</label>
    	<input type="checkbox" id="tos2" name="tos2" class="toss">
   		<div>
    		<iframe class="iframe" src="
    		<c:url value='/common/personal.html'/>"></iframe>
    	</div>
    </div>
</div>
    <div class="container" style="background-color:#f1f1f1">
      <button type="submit" id="bt1" class="cancelbtn">다음</button>
    </div>
  </form>
</div>
</div>
<script>
// Get the modal

// When the user clicks anywhere outside of the modal, close it
</script>

</body>
</html>
