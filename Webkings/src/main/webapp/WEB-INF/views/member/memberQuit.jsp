<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../inc/top.jsp"  %>
<style>
.divQuit{
	margin:0 auto;
	margin-top: 200px;
	text-align: center;
	width: 330px;
	border: 0.5px solid silver;
	background-color: white;
	height: 500px;
	
}
.divp{
	margin: 0 auto;
	margin-top: 70px;
	border: 2px solid silver;
	width: 300px;
}

.divp p{
	text-align:center;
	font-size: 13px;
}
.cancelbtn{
	width: 300px;
	padding-left: 5px;

</style>
<script type="text/javascript">

$(document).ready(function(){
	  $("#cancelbtn").click(function(){
		  
		if(!$("#inquit").is(":checked")){
			alert("탈퇴약관에 동의하셔야 합니다.");
			return false;
		}
		
		if(!confirm("정말 탈퇴하시겠습니까?")){
			return false;
		}else {
			$("#divQuit").submit();
		}
	});
});


</script>
<div class="body-sec">
<div class="in-sec">
	<div class="divQuit">
		<form  action="<c:url value="/member/memberQuit.do"/>" method="post" id="formQuit">
			<div class="divp">
				<h2>다음 안내사항을 확인해주세요</h2>
			<p>
				탈퇴 후 회원정보 및 개인형 서비스 정보는<br>
				 모두 삭제 됩니다.<br>
				가입시 입력한 정보 : 이메일, 닉네임, 생년월일, 성별<br> 
				서비스 이용 정보 : Point, 친구쇼핑몰목록, 관심상품<br>
				삭제된 정보는 복구 불가능합니다</p>
			</div>
			<div>
				<input type="checkbox" id="inquit" name="inquit">
				<label for="inquit">내용을 확인하였으며, 이에 동의합니다.</label>
			</div>
			<button type="submit" class="cancelbtn" id="cancelbtn">회원탈퇴</button>
		</form>
	</div>		
</div>
</div>
</body>
</html>