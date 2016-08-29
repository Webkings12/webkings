<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
</script>
<style type="text/css">
	#list{
	   list-style:none;
	}
	input::-webkit-input-placeholder { color: #f00; }
	#frm{
		margin: 0 auto;
	}
	body {
    height: 100%;
    margin: 0;
    padding: 0;
    color: #202022;
    background-color: #f2f2f5;
    line-height: 136%;
    font-size: 12px;
    text-align: left;
    word-spacing: -0.2em;
    letter-spacing: -0.04em;
    position: relative;
    overflow-y: scroll;
    font-family: 'Malgun Gothic','맑은 고딕','NanumBarunGothic','나눔바른고딕','NanumGothic','나눔고딕','Tahoma','Nanum Barun Gothic','Apple SD Gothic Neo Bold','Apple SD Gothic Neo','애플 SD 고딕 Neo','dotum',sans-serif;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body >
	<div >
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