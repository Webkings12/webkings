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


	.inquiry-sec-2{
	margin: 0 auto;
	margin-top: 150px;
	
	width: 400px;
	}
	.inquiry-sec-2 ul li input[type=text] {
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

.inquiry-sec-2 ul li textarea {
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
</style>

<div class="inquiry-sec-2" style="text-align: center">
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
		</div>
		<input type="submit" class="sys-btn-2" value="문의 보내기">
	</form>
</div>
</body>
</html>