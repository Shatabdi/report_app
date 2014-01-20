// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){

	$(function(){
			var total = $("#total_events").val()
			
		$(window).scroll(function(){

			if($(document).height()==$(window).scrollTop()+$(window).height()){
				var ctr = $("#counter").val()
				if(ctr*10 < total){
				 	$.ajax({
					type: "get",
					url: '/dashboard',
					data: { counter: ctr },
					dataType: 'script'
					});
				}
			}
		});
	});

	var clickOnPopupLink = function(){
	  $('body').on('click', '.static-popup-link', function(){
	    $("#myModal").html("loading..");
	    $('#myModal').modal('show');
	  });
	}
	clickOnPopupLink();


	$('#tiles li').wookmark({
		autoResize: true, // This will auto-update the layout when the browser window is resized.
		container: $('#tiles'), // Optional, used for some extra CSS styling
		offset: 4, // Optional, the distance between grid items
		itemWidth: 210, // Optional, the width of a grid item
		verticalOffset: 4,
		outerOffset: 6
	});

});

