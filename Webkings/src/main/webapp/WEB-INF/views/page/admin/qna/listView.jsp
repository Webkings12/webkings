<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/board.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/qna.css"/>
<!-- ------------------------------------------------------------------------여기부터 위는 인클루드 -->
<script type="text/javascript">
$(document).ready(function(){
	$("tr")
		.hover(function(){
			$(this).css("background","skyblue")
				.css("cursor","pointer");
		}, function(){
			$(this).css("background","");
		});
});

function pageProc(curPage){
	document.frmPage.currentPage.value=curPage;
	document.frmPage.submit();
}
</script>
<form name="frmPage" method="post" 
	action="<c:url value='/admin/qna/list.do'/>">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchCondition" 
		value="${param.searchCondition }">
	<input type="hidden" name="searchKeyword" 
		value="${searchVO.searchKeyword }">	
</form>
	<div class="topMargin">
		
<div class="divList2">
<div class="align_left">
	<h2>qna</h2>
	<c:if test="${!empty param.searchKeyword }">
		<p>검색어 : ${param.searchKeyword },${pagingInfo.totalRecord }건 검색되었습니다</p>
	</c:if> 
		
	<c:if test="${empty param.searchKeyword }">
		<p>전체조회 : ${pagingInfo.totalRecord }건 검색되었습니다</p>
	</c:if>
</div>
<table class="listTable noneDeco"
	 	summary="기본 게시판에 관한 표로써, 번호, 제목, 작성자, 작성일, 조회수에 대한 정보를 제공합니다.">
	<colgroup>
		<col style="width:10%;" />
		<col style="width:60%;" />
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
	  </tr>
	</thead> 
	<tbody>  
	<c:if test="${empty alist }">
		<tr>
			<td colspan="5" class="align_center">데이터가 없습니다</td>
		</tr>
	</c:if>
	  <!--게시판 내용 반복문 시작  -->
	<c:if test="${!empty alist }">
	<c:forEach var="vo" items="${alist }">
	<tr style="text-align: center">
		 	 	<td>${vo.qNo }</td>
		 		<td><a href="<c:url value='/admin/qna/detail.do?no=${vo.qNo}&currentPage=${pagingInfo.currentPage}&searchKeyword=${searchVo.searchKeyword }&searchCondition=${searchVo.searchCondition }'/>">
		 		<!-- 제목이 긴경우 일부만 보여주기 -->
		 		<c:if test="${fn:length(vo.qTitle)>25 }">
		 			${fn:substring(vo.qTitle,0,25) }...
		 		</c:if>
		 		<c:if test="${fn:length(vo.qTitle)<=25 }">
		 			${vo.qTitle}
		 		</c:if>
		 		</a>
				<!-- 24시간 이내의 글인 경우 new 이미지 보여주기 -->
				<c:if test="${vo.newImgTerm<24 }">
					<img src="<c:url value='/images/new.gif'/>" alt="new 이미지">
				</c:if>		 		
		 		</td>
		 		<td>${vo.mEmail }</td>
		 		<td>
					<c:if test="${vo.newImgTerm>24 }">
			 		<fmt:formatDate value="${vo.qRegdate }" pattern="yyyy-MM-dd"/>
			 		</c:if>
			 		<c:if test="${vo.newImgTerm<=24 }">
			 		<fmt:formatDate value="${vo.qRegdate }" pattern="HH:mm"/>
			 		</c:if>
				</td>
		 	</tr>
	</c:forEach>
	  <!--반복처리 끝  -->
	</c:if>
	  </tbody>
</table>	   

	<!-- 이전 블록으로 이동 -->
<div class="divFrm3">
<c:if test="${pagingInfo.firstPage>1 }">
	<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
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


	<div class="divFrm3" 
	<c:if test="${sessionScope.mType!='0' }">
		style="display: none;"
	</c:if>
	>
	   	<form name="frmSearch" method="post" action='<c:url value="/admin/qna/list.do"/>'>
	        <select name="searchCondition">
				<option value="q_Title"
					<c:if test="${param.searchCondition=='q_Title'}">
						selected
					</c:if>	 
				>제목</option>
	            <option value="q_Content" 
	            	<c:if test="${param.searchCondition=='q_Content'}">
	            	selected
	            	</c:if>
	            >내용</option>
	            
		            <option value="m_Email"
		            	<c:if test="${param.searchCondition=='m_Email'}">
		            	selected
		            	</c:if>
		            >작성자</option>
	            
	        </select>
	           
	        <input type="text" name="searchKeyword" title="검색어 입력" value="${param.searchKeyword }" id="searchKey" >
	           
			<input type="submit" value="검색" id="btSearch2">
	    </form>
	</div>

</div >
	</div>


</body>
</html>