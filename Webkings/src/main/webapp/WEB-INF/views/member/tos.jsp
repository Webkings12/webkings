<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.1.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#form").submit(function(event){
			if(!$("#tos1").is(":checked")){
				alert("이용약관에 동의하셔야 합니다.");
				$("#tos1").focus();
				event.preventDefault();
			}else if (!$("#tos2").is(":checked")) {
				alert("개인정보취급방침에 동의하셔야 합니다");
				$("#tos2").focus();
				event.preventDefault();
			}
			
		});
	});
</script>	
<style>
/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 17%; /* Could be more or less, depending on screen size */
    height: 500px;
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 40%;
       height: 50%;
    }
}

<!-- -->
.tos{
	text-align: center;	
}

.iframe{
	width:300px;
	height:100px;
}
.container{
	text-align: center;
}
</style>
<body>
<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">회원가입</button>

<div id="id01" class="modal">
  
  <form id="form" class="modal-content animate" method="get" 
  action="<c:url value='/member/register.do'/>">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <h2>약관동의</h2>
    </div>
  
    <div class="tos">
    	<h3>이용약관</h3>
    	<input type="checkbox" id="tos1" name="tos1">
    	<div>
    		<iframe class="iframe" src="
    		<c:url value='/common/provision.html'/>"></iframe>
    	</div>
    </div>
    <div class="tos">
    	<h3>개인정보취급방침</h3>
    	<input type="checkbox" id="tos2" name="tos2">
   		<div>
    		<iframe class="iframe" src="
    		<c:url value='/common/personal.html'/>"></iframe>
    	</div>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="submit" id="bt1" onclick="document.getElementById('id01').style.display='none'"] class="cancelbtn">다음</button>
    </div>
  </form>
</div>

<script>
// Get the modal

// When the user clicks anywhere outside of the modal, close it
</script>

</body>
</html>
