<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clear.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/top_m.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/top_f.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/body.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript">
 	$(document).ready(function() {
 		/* var contextPath="/Webkings";
 		var pathName=""; */
 	
		var gender="F";		
		$(".gnb li").mouseenter(function() {
			$(".gnb li:first-child").removeClass("active");
			$(this).addClass("active");
		})
		$(".gnb li").mouseleave(function() {
			$(this).removeClass("active");
			$(".gnb li:first-child").addClass("active");
		});
		
		$(".gender.m").click(function() {
			gender="M";
			if($("body").hasClass("F")){
				$("body").removeClass("F");
				$("body").attr("class","M");
			}
		});
			$(".gender.f").click(function(){
				gender="F";
			if($("body").hasClass("M")){
				$("body").removeClass("M");
				$("body").attr("class","F");
			}
		});
	
		var page = "viewPage=product"+gender;
/* 	var loadPage="item/product/productF.jsp"; */
	alert(page);
	$(".gnb li").click(function() {
		alert("zzz"+viewPage);
		var li = $(".active #gnbPage").val();		
 		page="viewPage="+li;
 		if(li=="shop" || li=="product"){
 			page+=gender;
 		}
 		alert(page);
 		
 		$.ajax({
 			url:"<c:url value='/page.do'/>",
 			data:page,
 			type:"GET",
 			async:false,
 			dataType:"text",
 			success:function(res){
 				viewPage=res;
 				alert("success:"+viewPage);
 				$("#value").val(res);
 				var viewPage=$("#value").val();
 			},
 			error:function(xhr, status, error){
 				alert(error);
 			}
 		});
 		$("#cola").load(var viewPage=$("#value").val());
 		
	});
 		/* 클릭할때마다 불러오는 include*/
	 	
	/* 	  $.ajax({
	 			url:"<c:url value='/page.do'/>",
	 			data:page,
	 			type:"GET",
	 			dataType:"text",
	 			success:function(res){
	 				var viewPage =res;
	 				alert(res);
	 			},
	 			error:function(xhr, status, error){
	 				alert(error);
	 			}
	 		});      */ 
}); 
</script>
	 <input type="text" id="value" value="${viewPage}", style="margin-top: 150px;"/>
	 <c:set var="viewPage" value="${viewPage}"></c:set>
     <jsp:include page="inc/top.jsp" flush="false" /> 
<div class="body-sec">
	<div class="in-sec" id="cola">
		  <jsp:include page="${viewPage}.jsp" flush="false" /> 
	</div>
</div>
</body>
</html>