<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	var loadPage="item/product/productF.jsp";
	alert(page);
	$(".gnb li").click(function() {
		var li = $(".active #gnbPage").val();		
 		page="viewPage="+li;
 		if(li=="product"){
 			page+=gender;
 		}
 		if(li=="shop"){
 			page+=gender;
 		}
 		alert(page);
 		
 		/* 클릭할때마다 불러오는 include*/
 		
 		 $.ajax({
 			url:"<c:url value='/page.do'/>",
 			data:page,
 			type:"GET",
 			dataType:"html",
 			success:function(res){
 				alert(res);
 				$(".in-sec").html(res);
 			},
 			error:function(xhr, status, error){
 				alert(error);
 			}
 		});     
	});
	
	/*처음실행될때 초기화면*/
 	 $.ajax({
		url:"<c:url value='/page.do'/>",
		data:page,
		type:"GET",
		dataType:"json",
		success:function(res){
			alert(res);
			 $(".in-sec").html(res); 
		},
		error:function(xhr, status, error){
			alert(error);
		}
	});     
});
</script>
<%@ include file="inc/top.jsp" %>
<div class="body-sec">
	<div class="in-sec">
         <jsp:include page="${ss}"></jsp:include> 
	</div>
</div>
</body>
</html>