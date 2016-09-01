<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#frmWrite").submit(function(event){
			if($("#title").val()==""){
				alert("제목을 입력하세요");
				$('#title').focus();
				event.preventDefault();
			}
		});
	});
	
	window.onload=function(){
		
	};
</script>
<style type="text/css">
	.divFrm2{
		margin: 0 auto;
		margin-top: 200px;
		width: 600px;
		text-align: center;
	}
	.divFrm3{
		margin: 0 auto;
		width: 600px;
		text-align: center;
	}

.btn_default.btn_light {
    padding: 0;
}
.btn_default {
    display: inline-block;
    height: 40px;
    line-height: 40px;
    text-align: center;
    width: 150px;
    font-weight: 700;
    cursor: pointer;
    -webkit-box-shadow: 0 3px 10px -3px #aaa;
    -moz-box-shadow: 0 3px 10px -3px #aaa;
    box-shadow: 0 3px 10px -3px #aaa;
}
.btn_large {
    padding: 10px 40px;
    font-size: 20px;
}
.btn_light {
    padding: 4px 9px;
    color: #666;
    border: 1px solid #ccc;
    background-color: #fff;
    font-weight: 700;
    cursor: pointer;
    text-align: center;
    display: inline-block;
}
.btn_BaW {
	
    /* background-color: #1A70DC; */
    background-color: #FF00CC;
}


.divFrm2 input[type=text] {
    height: 40px;
    border: 1px solid #e4e6e9;
    text-indent: 12px;
    width: 88%;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    padding-top: 0;
}

.divFrm2 textarea {
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
    height: 300px;
    
}
.float_left{
	float: left;
}
.align_center{
	text-align: center;
	margin: 0 auto;
}
.btn .btn_BaW {
	color: #FFFFFF;
}
.top_Padding{
	padding-top: 10px;
}
</style>

<form name="frmPage" method="post" 
	action="<c:url value='/board/list.do'/>">
	<input type="text" name="currentPage">
	<input type="text" name="searchCondition" 
		value="${param.searchCondition }">
	<input type="text" name="searchKeyword" 
		value="${searchVO.searchKeyword }">	
</form>
<h2>자유게시판</h2>
<c:if test="${!empty param.searchKeyWord }">
	<p>검색어 : ${param.searchKeyword },${pagingInfo.totalRecord }건 검색되었습니다</p>
</c:if> 
	
<c:if test="${empty param.searchKeyWord }">
	<p>전체조회 : ${pagingInfo.totalRecord }건 검색되었습니다</p>
</c:if>


<div class="divFrm2">
<table class="box2"
	 	summary="기본 게시판에 관한 표로써, 번호, 제목, 작성자, 작성일, 조회수에 대한 정보를 제공합니다.">
	<caption>자유 게시판</caption>
	<colgroup>
		<col style="width:10%;" />
		<col style="width:50%;" />
		<col style="width:15%;" />
		<col style="width:15%;" />
		<col style="width:10%;" />		
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">번호</th>
	    <th scope="col">제목</th>
	    <th scope="col">작성자</th>
	    <th scope="col">작성일</th>
	    <th scope="col">조회수</th>
	  </tr>
	</thead> 
	<tbody>  
	<c:if test="${empty alist }">
		<tr>
			<td colspan="5" class="align_center">자료없다</td>
		</tr>
	</c:if>
	  <!--게시판 내용 반복문 시작  -->
	<c:if test="${!empty alist }">
	<c:forEach var="vo" items="${alist }">
	<tr style="text-align: center">
		 	 	<td>${vo.no }</td>
		 		<td><a href="<c:url value='/board/updateCount.do?no=${vo.no}'/>">
		 		<!-- 제목이 긴경우 일부만 보여주기 -->
		 		<c:if test="${fn:length(vo.title)>30 }">
		 			${fn:substring(vo.title,0,30) }...
		 		</c:if>
		 		<c:if test="${fn:length(vo.title)<=30 }">
		 			${vo.title}
		 		</c:if>
		 		</a>
				<!-- 24시간 이내의 글인 경우 new 이미지 보여주기 -->
				<c:if test="${vo.newImgTerm<24 }">
					<img src="<c:url value='/images/new.gif'/>" alt="new 이미지">
				</c:if>		 		
		 		</td>
		 		<td>${vo.name }</td>
		 		<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
		 		<td>${vo.readcount }</td>
		 	</tr>
	</c:forEach>
	  <!--반복처리 끝  -->
	</c:if>
	  </tbody>
</table>	   
</div >
	<!-- 이전 블록으로 이동 -->
<div class="divFrm3">
<c:if test="${pagingInfo.firstPage>1 }">
	<a href="#" onclick="pageProc(${pagingIngo.firstPage-1})">
	<img src="<c:url value='/images/first.JPG'/>" alt="이전으로 이동"></a>
</c:if>
	<!-- 페이지 번호 추가 -->		
						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
		<c:if test="${i==pagingInfo.currentPage }">
			<span style="font-weight: bold;color:blue;font-size: 1.2em">${i }</span>
		</c:if>
		<c:if test="${i!=pagingInfo.currentPage }">
			<a href="#" onclick="pageProc(${i})">[${i }]</a>
		</c:if>
		
	</c:forEach>
	<!--  페이지 번호 끝 -->
	
	<!-- 다음 블록으로 이동 -->
	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
	<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})">
	<img src="<c:url value='/images/last.JPG'/>" alt="다음 블록 이동"></a>
	</c:if> 
</div>

<div class="divFrm3">
   	<form name="frmSearch" method="post" action='<c:url value="/board/list.do"/>'>
        <select name="searchCondition">
			<option value="title"
				<c:if test="${param.searchCondition=='title'}">
					selected
				</c:if>	 
			>제목</option>
            <option value="content" 
            	<c:if test="${param.searchCondition=='content'}">
            	selected
            	</c:if>
            >내용</option> 
            <option value="name"
            	<c:if test="${param.searchCondition=='name'}">
            	selected
            	</c:if>
            >작성자</option>
        </select>
           
        <input type="text" name="searchKeyword" title="검색어 입력" value=${param.searchKeyword } >
           
		<input type="submit" value="검색">
    </form>
</div>

<div class="divFrm3">
    <a href='<c:url value="/board/write.do"/>' >글쓰기</a>
</div>

