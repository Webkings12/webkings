<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/board.css"/>
<script type="text/javascript">

$(document).ready(function(){
	$("tr").hover(function(){
			$(this).css("background","skyblue")
				.css("cursor","pointer");
		}, function(){
			$(this).css("background","");
		});
	$("ul").hover(function(){
		$(this).find("span").css("display","block");
			
	}, function(){
		$(this).find("span").css("display","none");
	});
});
function pageProc(curPage){
	document.frmPage.currentPage.value=curPage;
	document.frmPage.submit();
}

/* function pageProc2(bNo){
	//alert(bNo);
	document.frmPage2.bNo.value=bNo;
	document.frmPage2.submit();
		
} */
</script>


<div>
		<form name="frmPage" method="post" 
	action="<c:url value='/freeboard/list.do'/>">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchCondition" 
		value="${param.searchCondition }">
	<input type="hidden" name="searchKeyword" 
		value="${searchVo.searchKeyword }">	
</form>

<%-- <form name="frmPage2" method="post" 
	action="<c:url value='/freeboard/updateCount.do'/>">
	<input type="hidden" name="currentPage"
		value=${pagingInfo.currentPage }>
	<input type="hidden" name="searchCondition" 
		value="${searchVO.searchCondition }">
	<input type="hidden" name="searchKeyword" 
		value="${searchVO.searchKeyword }">
	<input type="hidden" name="bNo"
		value="${searchVO.bNo }">		
</form> --%>



<div class="divList2">
		<div class="align_left">
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
			<col style="width:55%;" />
			<col style="width:15%;" />
			<col style="width:10%;" />
			<col style="width:10%;" />		
		</colgroup>
		<thead>
		  <tr>
		    <th scope="col">이미지</th>
		    <th scope="col">제목</th>
		    <th scope="col">작성자</th>
		    <th scope="col">날짜</th>
		    <th scope="col">조회수</th>
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
			 	 	<td>
					 	 	<ul><img class="imageView" style="width:50px;height:50px;margin:0;" id="upBoardImage" 
						 	 	<c:if test="${empty vo.bFilename }">
						 	 	src="<c:url value='/fBoardImages/none_data.png'/>"
						 	 	</c:if>
						 	 	<c:if test="${!empty vo.bFilename }">
						 	 	src="<c:url value='/fBoardImages/${vo.bFilename }'/>"
						 	 	</c:if>
					 	 		>
					 	 		<c:if test="${!empty vo.bFilename }">
			 	 					<span style="display: none;position: absolute;left: 30%;"><img id="imageView" src="<c:url value='/fBoardImages/${vo.bFilename }'/>"  ></span>
			 	 				</c:if>
			 	 			</ul>
			 	 	</td>
			 	 	<%-- <td>${vo.bNo }</td> --%>
			 		<td><a 
			 			href="<c:url value='/freeboard/detail.do?no=${vo.bNo }&currentPage=${pagingInfo.currentPage}&searchKeyword=${searchVo.searchKeyword }&searchCondition=${searchVo.searchCondition }&gender=${gender }'/>"
			 			>
			 		<!-- 제목이 긴경우 일부만 보여주기 -->
			 		<c:if test="${fn:length(vo.bTitle)>20 }">
			 			<span title="${vo.bTitle }">${fn:substring(vo.bTitle,0,20) }...</span>
			 		</c:if>
			 		<c:if test="${fn:length(vo.bTitle)<=20 }">
			 			${vo.bTitle}
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
			 		<fmt:formatDate value="${vo.bRegdate }" pattern="yyyy-MM-dd"/>
			 		</c:if>
			 		<c:if test="${vo.newImgTerm<=24 }">
			 		<fmt:formatDate value="${vo.bRegdate }" pattern="HH:mm"/>
			 		</c:if>
			 		</td>
			 		<td>${vo.bReadcount }</td>
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
				<span style="font-weight: bold;color:#FF4AC0;font-size: 1.2em">${i }</span>
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
	   	<form name="frmSearch" method="post" action='<c:url value="/freeboard/list.do"/>'>
	        <select name="searchCondition">
				<option value="b.b_Title"
					<c:if test="${searchVo.searchCondition=='b.b_Title'}">
						selected
					</c:if>	 
				>제목</option>
	            <option value="b.b_Content" 
	            	<c:if test="${searchVo.searchCondition=='b.b_content'}">
	            	selected
	            	</c:if>
	            >내용</option> 
	            <option value="m.m_Email"
	            	<c:if test="${searchVo.searchCondition=='m.m_Email'}">
	            	selected
	            	</c:if>
	            >작성자</option>
	        </select>
	           
	        <input type="text" name="searchKeyword" title="검색어 입력" value="${searchVo.searchKeyword }" id="searchKey" >
	           
			<input type="submit" value="검색" id="btSearch2">
	    </form>
	    	<div class="align_right">
	    		<a href='<c:url value="/freeboard/list.do?gender=${gender }"/>' class="btn_default btn_light size_M" >목록</a>
			    <a href='<c:url value="/freeboard/write.do?gender=${gender }"/>' class="btn_default btn_light size_M" >글쓰기</a>
			</div>
	</div>
	
	
</div >
		
		
		<%-- <c:import url="/freeboard/list.do"></c:import> --%>
	</div>
