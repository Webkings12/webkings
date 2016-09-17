<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/top.jsp"  %>

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