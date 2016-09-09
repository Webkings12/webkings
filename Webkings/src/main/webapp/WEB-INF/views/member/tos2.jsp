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

			$("#id01").css("display","none");

		});
	});
</script>	

<div id="id01" class="modal">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
  <div class="amodel">
 
<div class="modal1">
    <div class="imgcontainer">
      <h2 class="h2">비밀번호 찾기</h2>
      <hr>
    </div>
  
    	<div class="tos">
    		<p>가입하신 회원님의 이메일 주소를 입력해 주세요.
					비밀번호를 초기화 할 수 있는 메일을 발송해 드립니다.</p>
    	</div>
    	<div class="tos">
    		<input type="text" placeholder="이메일을 입력하세요" name="mEmail" id="mEmail2">
    	</div>
    </div>
</div>
    <div class="container">
      <button type="submit" id="bt1" class="cancelbtn">확인</button>
    </div>
  </form>
</div>
</body>
</html>

