/**
 * 
 */
$(document).ready(function() {
	$(".sys-btn.sys-btn-type4").click(function(){
		$(".modal").css("display", "block");
			
		$("#reg").click(function () {
			$("#divLogin").css("display","none");
			$("#divtos").css("display","block");
		});
		
		$("#find").click(function () {
				$("#divLogin").css("display","none");
				$("#divfind").css("display","block");
		});
	});
});