$(document).ready(function(){
	$("body").on("click",".cancelar",function(){
		window.location.assign($(this).attr("href"));
	});
	$("body").on("click",".tab-button",function(){
		$(".tab-list .button-active").removeClass("button-active");
		$(".active-tab").removeClass("active-tab");
		$(this).addClass("button-active");
		$($(this).attr("tab")).addClass("active-tab");
	});
});

