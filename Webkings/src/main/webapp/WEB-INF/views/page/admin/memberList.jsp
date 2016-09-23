<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript">
$(document).ready(function() {
	$("input[name='allchk']").click(function() {
		$("tbody input[type='checkbox']").prop("checked", this.checked);
	});
	
	$("#frmList").submit(function() {
		var count= $("tbody input[type='checkbox']:checked").length;
		if(count==0){
			alert("삭제하려는 상품을 먼저 체크하세요");
			return false;
		}
	});
	
	for(var i=0;i<$("#length").val();i++){
		$("#adel"+i).click(function(){
			if(confirm("정말 삭제하시겠습니까?")){
				return true;
			}else {
				return false;
			}
		}); 	
	}
});
function pageProc(curPage){
	document.frmPage.currentPage.value=curPage;
	document.frmPage.submit();
}
</script>
<form name="frmPage" id="frmPage" method="post" 
	action="<c:url value='/admin/memberList.do'/>">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchKeyword" 
		value="${searchVo.searchKeyword}">	
</form>

<div class="body-sec">
<div class="in-sec">

<p class="privacy-fixed" id="adminPf"><a href="<c:url value='/admin.do'/>">홈으로</a></p>
		<div class="footer">
			<div class="list-top-2">
				<div class="in">
					<div class="tab-type-2">
						<ul>
							<li class="active single"><a href="javascript:;" class="nlink" >회원정보 관리</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div>
			</div>
			<%-- <form name="frm11" id="frm11" method="post" 
				action="<c:url value='/admin/memberList.do'/>">
			<div class="searchbiv">	
				<input type="text" name="searchKeyword" title="검색어 입력"  id="searchmEmail"
			 	value="${param.searchKeyword}">
			</div>
			<button type="submit" id="searchbt" class="searchbt">검색</button>
			</form> --%>
			
			<form id="frmList" name="frmList" method="post" action="<c:url value= '/admin/memberDeleteList.do'/>">
			<div class="divList">
				<table class="List">
					<colgroup>
						<col style="width: 6%">
						<col style="width: 11%">
						<col style="width: 24%">
						<col style="width: 15%">
						<col style="width: 19%">
						<col style="width: 15%">
						<col style="width: 10%">
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" name="allchk" id="allchk"></th>
							<th>회원번호</th>
							<th>회원이메일</th>
							<th>회원닉네임</th>
							<th>회원이미지</th>
							<th>가입일</th>
							<th>회원삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty memberList }">
							<tr class="tr_center">
								<td colspan="6">
									회원정보가 없습니다.
								</td>
							</tr>
						</c:if>
						<c:set var="i" value="0"/>
								<input type="hidden" id="length" value="${memberList.size()}">
						<c:if test="${!empty memberList }">
							<c:forEach var="vo" items="${memberList }" varStatus="vs">
							<tr class="tr_center">
								<td><input type="checkbox" name="memberDelList[${i}].mEmail" value="${vo.mEmail}" id="chk_${i }"></td>
								<input type="hidden" name="memberDelList[${i}].mImage" value="${vo.mImage}">
								<td>${vo.mNo}</td>
								<td><a href="#" id="memEdit${vs.index }">${vo.mEmail}</a>
								<input type="hidden" value="${vo.mEmail}">
								<input type="hidden" value="${vo.mNick}">
								<input type="hidden" value="${vo.mImage}">
								<input type="hidden" value="${vo.mNo}"></td>
								<td>${vo.mNick}</td>
								<td>
								<c:if test="${!empty vo.mImage}">
									<img alt="회원이미지" src="<c:url value='/user_images/${vo.mImage}'/>"
									style="height: 50px;">
								</c:if>
								<c:if test="${empty vo.mImage}">
									<img alt="이미지" src="<c:url value='/user_images/person-icon.png'/>"
									style="height: 50px;">
								</c:if>
								</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.mRegdate}"/></td>
								<td><a id="adel${vs.index}" href="<c:url value='/admin/memberQuit.do?mEmail=${vo.mEmail}&mImage=${vo.mImage}'/>">회원삭제</a></td>
							</tr>
							<c:set var="i" value="${i+1}"/>
							</c:forEach>	
					</tbody>
				</table>
						<!-- 이전 블록으로 이동 -->
					<div style="text-align: center;">
						<c:if test="${pagingInfo.firstPage>1 }">
							<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})"> <img
								src="<c:url value='/images/first.JPG'/>" alt="이전으로 이동"></a>
						</c:if>
						<!-- 페이지 번호 추가 -->

						<!-- [1][2][3][4][5][6][7][8][9][10] -->
						<c:forEach var="a" begin="${pagingInfo.firstPage }"
							end="${pagingInfo.lastPage }">
							<c:if test="${a==pagingInfo.currentPage }">
								<span class="apage"
									style="font-weight: bold; color: #888;">${a }</span>
							</c:if>
							<c:if test="${a!=pagingInfo.currentPage }">
								<a class="apage" href="#" onclick="pageProc(${a})">&nbsp;&nbsp;${a }&nbsp;&nbsp;</a>
							</c:if>

						</c:forEach>
						<!--  페이지 번호 끝 -->

						<!-- 다음 블록으로 이동 -->
						<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
							<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})"> <img
								src="<c:url value='/images/last.JPG'/>" alt="다음 블록 이동"></a>
						</c:if>
					</div>
				</div>
			<div class="divdtn" style="margin: 0 auto; width: 700px;">
				<button type="submit" class="cancelbtn" id="delcancelbtn" style="text-align: center;">선택한 회원삭제</button>
			</div>
		</c:if>
	</div>
</form>
		<%@ include file="../../inc/adminFooter.jsp" %>
		
		
</div>
</div>
</div>
	
</body>
</html>