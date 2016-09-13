<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/top.jsp"  %>
<script type="text/javascript">
//회원정보 수정
function readURL1(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $("#UploadImg").attr("src", e.target.result);
            $("#UploadImg").css({"width":"80px"},{"height":"80px"});
            $("#UploadImg").css("border-radius","40px");
        }
        reader.readAsDataURL(input.files[0]);
    }
}

$(document).ready(function(){
	$("#formEdit").submit(function(){
 		if($("#oldmpwd").val()!=$("#chkpwd").val()){
			alert("비밀번호가 다릅니다.");
			$("#oldmpwd").focus();
			return false;
		}
	});
});
</script>
<div class="body-sec">
<div class="in-sec">
<style type="text/css">
.divEdit{
	margin: 0 auto;
	margin-top: 200px;
	text-align: center;
	width: 300px;
	height: 300px;
	border: 0.5px solid silver;
	background-color: white;
	height: 250px;
}

.cancelbtn{
	width: 70%;
	padding-left: 5px;
}
#mNick{
	width: 60%;
}
.imgfile{
	margin-top: 50px;
}

#memberQuit{
	color: #492147;
	border: 1px solid silver;
	background-color: white;
	width: 70%;
	height: 30px;
	text-align: center;
}

</style>
	<div class="divEdit">
		<form id="formEdit" name="formEdit" target="_iFrmForAction" method="post" 
		action="<c:url value='/member/memberEdit.do'/>" enctype="multipart/form-data">
		<div>

			<div class="imgfile">
				<img id="UploadImg" src="" />
			</div>
			<div>
				<input type='file' name="upFile1" id="upFile1" onchange="readURL1(this)"/>
				<input type="hidden" name="oldmImage" value="${membervo.mImage }">
			</div>
		</div>
		<div id="divQuit">
			<label for="mNick">닉네임: </label>
			<input type="text" name="mNick" placeholder="닉네임" id="mNick" value="${membervo.mNick}"><br>
			<input type="text" name="oldmpwd" placeholder="예전비밀번호" id="oldmpwd" ><br>
			<input type="hidden" name="chkpwd" id="chkpwd" value="${membervo.mPwd}"><br>
			<input type="text" name="chgmpwd" placeholder="바꾸실 비밀번호" id="chgmpwd" ><br>
			<a href="
			<c:url value='/member/memberQuit.do?oldmImage=${membervo.mImage}'/>"
			 id="memberQuit"><p>회원탈퇴</p></a>
		</div>
			<button type="submit" class="cancelbtn">수정완료</button>

		</form>
	</div>

</div>
</div>
</body>
</html>