<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<style type="text/css">
	#list{
	   list-style:none;
	}
	
	input::-webkit-input-placeholder { color: #FF00CC; }
	textarea::-webkit-input-placeholder { color: #FF00CC; }
	#frm{
		margin: 0 auto;
	}


	.divFrm1{
	margin: 0 auto;
	margin-top: 150px;
	
	width: 450px;
	}
	.divFrm1 ul li input[type=text], .agree label {
    height: 40px;
    border: 1px solid #e4e6e9;
    text-indent: 12px;
    width: 100%;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

.divFrm1 ul li textarea {
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
    height: 170px;
}

.btn_default {
    display: inline-block;
    height: 40px;
    line-height: 40px;
    text-align: center;
    width: 100%;
    font-weight: 700;
    cursor: pointer;
    -webkit-box-shadow: 0 3px 10px -3px #aaa;
    -moz-box-shadow: 0 3px 10px -3px #aaa;
    box-shadow: 0 3px 10px -3px #aaa;
    font-size: 15px;

}
.btn_light {
    color: #666;
    border: 1px solid #ccc;
    background-color: #fff;
    font-weight: 700;
    cursor: pointer;
    text-align: center;
    display: inline-block;
}
.back_color {
    background-color: #FF00CC;
    color:white;
}
.after {
    content: "";
    background-image: url("/rsc/front/img/sprite.png?_1471437666729");
    -webkit-background-size: 252px 234px;
    -moz-background-size: 252px 234px;
    -o-background-size: 252px 234px;
    background-size: 252px 234px;
    background-repeat: no-repeat;
    background-position: -119px -92px;
    width: 13px;
    height: 10px;
    position: absolute;
    top: 50%;
    -webkit-transform: translate(0,-50%);
    -moz-transform: translate(0,-50%);
    -ms-transform: translate(0,-50%);
    -o-transform: translate(0,-50%);
    transform: translate(0,-50%);
    right: 12px;
}
.agree label {
    line-height: 40px;
    text-indent: 12px;
    display: block;
    background-color: #fff;
    border-bottom: 1px solid #e4e6e9;
    position: relative;
    cursor: pointer;
}
input[type=checkbox]{
	-webkit-appearance: checkbox;
	box-sizing: border-box;
    padding: initial;
    border: initial;
    -webkit-rtl-ordering: logical;
    -webkit-user-select: text;
    cursor: auto;
}
.div1 {
    height: 150px;
    background-color: #fafafc;
    overflow-y: scroll;
    padding: 0 15px;
    
    word-break:break-all;
    width: 90%
}
.agree{
	word-break:break-all;
	
}

</style>

<script>
	$(document).ready(function(){
		$("#frmQna").submit(function(){
			if($("#qTitle").val().length<1){
				alert("제목을 입력하세요");
				$("#qTitle").focus();
				return false
			}else if($("#qContent").val().length<1){
				alert("내용을 입력하세요");
				$("#qContent").focus();
				return false
			}else if(!$("#agree-1").is(":checked")){
				alert("약관에 동의하셔야합니다");
				$("#agree-1").focus();
				return false
			
			}
			
			if(!validate_hp($("#qTel").val()) ){
				alert("휴대폰번호는 숫자여야 합니다");
				$("#qTel").focus();
				return false;
			}
		});
	});
	
	function validate_hp(hp){
		var pattern= new RegExp(/^[0-9--]*$/g);
		return pattern.test(hp);
		/*
		/^[0-9]*$/g
		0~에서 9 사이의 숫자로 시작하거나 끝난다는 의미
		(^ 시작, $ 끝을 의미)
		닫기 대괄호(]) 뒤의 * 기호는 이 패턴이 0번 그 이상 반복된다는 의미
		*/
	}
</script>
<div class="divFrm1" style="text-align: center">
	<form id="frmQna" name="frmQna" method="post" action="<c:url value='/qna/write.do' />" >
		<ul id="list">
			<li><input name="qTitle" type="text" id="qTitle" placeholder="제목"></li>
			<li><textarea name="qContent" id="qContent"  placeholder="문의내용"></textarea></li>
		</ul>
		<ul id="list">
			<li><input name="qTel" type="text" id="qTel"  placeholder="tel"></li>
		</ul>



				
		<br>
		<div class="agree">
			<input type="checkbox" id="agree-1">
			<label for="agree-1">개인정보 취급방침</label>
	    	<iframe class="div1" src="<c:url value='/common/personal.html'/>"></iframe>
		</div>
		<input type="submit" class="btn_default btn_light back_color" value="문의 보내기">
	</form>
</div>
</body>
</html>