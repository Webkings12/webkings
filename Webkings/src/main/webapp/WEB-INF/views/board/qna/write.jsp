<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<style type="text/css">
	#list{
	   list-style:none;
	}
	input::-webkit-input-placeholder { color: #f00; }
	#frm{
		margin: 0 auto;
	}


	.divFrm1{
	margin: 0 auto;
	margin-top: 150px;
	
	width: 400px;
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
</style>

<div class="divFrm1" style="text-align: center">
	<form id="frmQna" name="frmQna" method="post" action="/board/qna.do" >
		<ul id="list">
			<li><input name="title" type="text" id="title" placeholder="제목"></li>
			<li><textarea name="contents" id="contents"  placeholder="문의내용"></textarea></li>
		</ul>
		<ul id="list">
			<li><input name="comName" type="text" id="comName"  placeholder="회사명"></li>
			<li><input name="contactName" type="text" id="contactName"  placeholder="담당자명"></li>
			<li><input name="phone" type="text" id="phone"  placeholder="연락처"></li>
			<li><input name="email" type="text" id="email" placeholder="이메일"></li>
		</ul>



				
		
		<div class="agree">
			<input type="checkbox" id="agree-1">
			<label for="agree-1">개인정보 취급방침</label>
		</div>
		<input type="submit" class="btn_default btn_light back_color" value="문의 보내기">
	</form>
</div>
</body>
</html>