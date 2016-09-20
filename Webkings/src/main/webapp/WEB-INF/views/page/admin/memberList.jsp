<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="body-sec">
<div class="in-sec">
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
							<th><input type="checkbox" name="" id=""></th>
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
						<c:if test="${!empty memberList }">
							<c:forEach var="vo" items="${memberList }">
							<tr class="tr_center">
								<td><input type="checkbox" name="" id=""></td>
								<td>${vo.mNo}</td>
								<td>${vo.mEmail}</td>
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
								<td><a>회원삭제</a></td>
							</tr>
							</c:forEach>	
						</c:if>
					</tbody>
				</table>
			</div>


			<%@ include file="../../inc/adminFooter.jsp" %>
</div>
</div>
</div>
</body>
</html>