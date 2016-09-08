<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<table class="box2"
	 	summary="기본 게시판에 관한 표로써, 번호, 제목, 작성자, 작성일, 조회수에 대한 정보를 제공합니다.">
	<caption>기본 게시판</caption>
	<colgroup>
		<col style="width:10%;" />
		<col style="width:50%;" />
		<col style="width:15%;" />
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">이름</th>
	    <th scope="col">내용</th>
	    <th scope="col">작성일</th>
	  </tr>
	</thead> 
	<tbody>  
	<c:if test="${empty cList }">
		<tr>
			<td colspan="3" class="align_center">자료없다</td>
		</tr>
	</c:if>
	  <!--게시판 내용 반복문 시작  -->
	<c:if test="${!empty cList }">
	<c:forEach var="vo" items="${cList }">
	<tr style="text-align: center">
		 		<td>${vo.name }</td>
		 		<td>${vo.content}</td>
		 		<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
		 	</tr>
	</c:forEach>
	  <!--반복처리 끝  -->
	</c:if>
	  </tbody>
</table>	 