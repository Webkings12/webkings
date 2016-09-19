<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypage.css"/>

<style type="text/css">
.in-sec-2 {
    bottom: 52px;
}

.in-sec-2 {
    position: absolute;
    left: 0;
    top: 192px;
    right: 0;
    bottom: 0;
}

.company-sec {
    width: 480px;
    position: absolute;
    left: 50%;
    top: 50%;
    -webkit-transform: translate(-50%,-50%);
    -moz-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    -o-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);
}

.company-sec ul li strong {
    font-weight: normal;
    line-height: 50px;
    color: #a2a2a5;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}

/* .company-sec ul li span {
    position: absolute;
    top: 50%;
    -webkit-transform: translate(0,-50%);
    -moz-transform: translate(0,-50%);
    -ms-transform: translate(0,-50%);
    -o-transform: translate(0,-50%);
    transform: translate(0,-50%);
    right: 0;
    line-height: 50px;
} */
.company-sec ul li span {
	right: 0;
	line-height: 50px;
	position: absolute;
	
}
 html, body { height: 100%; margin: 0; padding: 0; }
#map { 
	height: 220px; 
	border: 1px solid gray;
	visibility: hidden;
	position: absolute;
	width: 400px;
	right: 100px;
	top:50%;
 }
 
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript" src="<c:url value='/js/mainM.js'/>"></script>
<script type="text/javascript">
$(document).ready(function() {
	var pageNum = ${pageNum};
	$(".gnb li:nth-child("+pageNum+")").addClass("active");
	
	$(".gnb li").mouseenter(function() {
		$(".gnb li").removeClass("active");
		$(this).addClass("active");
	})
	$(".gnb li").mouseleave(function() {
		$(this).removeClass("active");
		$(".gnb li:nth-of-type("+pageNum+")").addClass("active");
	});
});
</script>

<!-- <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ZgbUXbRzH4saGnCZGmLO"></script> -->
 <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnJWoRHK1xN_pQD5BBO1Vkr3HDnbTryec&callback=initMap">
    </script>
<%@ include file="../../inc/top.jsp" %>
<div class="body-sec">
<div class="in-sec">
<input type="hidden" id="myPageVal" value="company">
	<div class="footer">
			<div class="list-top-2">
				<div class="in">
					<div class="tab-type-2">
						<ul>
							<li class="active"><a href="javascript:;" class="nlink">회사소개</a></li>
						</ul>
					</div>
					<a href="javascript:;" class="back">이전</a>
				</div>
			</div>

			<div class="in-sec-2">
				<div class="company-sec">
					<img src="<c:url value='/images/WEBKINGS LOGO.png'/>" style="width: 480px; height: 240px;">
					<ul>
						<li><strong>회사명</strong><span>(주)WEBKINGS</span></li>
						<li><strong>사업자번호</strong><span>123-12-1234</span></li>
						<li><strong>설립일</strong><span>2016년 9월 17일</span></li>
						<li><strong>대표</strong><span>하승숴이</span></li>
						<li><strong>대표전화</strong><span>02.3456.7890</span></li>
						<li class="map"><strong>주소</strong><span>서울특별시 영등포구 당산동6가동화빌딩 8층 (주)WEBKINGS</span>
							<div class="map">
								<p id="map"></p>
							</div></li>
					</ul>
				</div>
			</div>
			<%@ include file="footer-sec.jsp" %>
	</div>
</div>
</div>
</body>
</html>

<script type="text/javascript">
	$(document).ready(function() {
		$(".map").hover(function(){
			$("#map").css("visibility","visible");
		},function(){
			$("#map").css("visibility","hidden");
		});
	
	});
		
	
/*네이버 	var mapOptions = {
		    center: new naver.maps.LatLng(37.3595704, 127.105399),
		    zoom: 10
		};

		var map = new naver.maps.Map('map', mapOptions); */
		
		
		
		
		var map;
		function initMap() {
	        var myLatLng = {lat: 37.535191, lng: 126.902618};

	        // Create a map object and specify the DOM element for display.
	        var map = new google.maps.Map(document.getElementById('map'), {
	          center: myLatLng,
	          scrollwheel: false,
	          zoom: 18
	        });

	        // Create a marker and set its position.
	        var marker = new google.maps.Marker({
	          map: map,
	          position: myLatLng,
	          title: 'Hello World!'
	        });
	      }


</script>
 <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnJWoRHK1xN_pQD5BBO1Vkr3HDnbTryec&callback=initMap">
    </script>
