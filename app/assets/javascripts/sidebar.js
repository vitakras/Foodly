var side_bar = function() {
	//click handler for the "F" at the top right of the screen 
	$( "#sidebar-btn" ).click(function() {
		toggle_sidebar();
	});

	//click handler for the overlay that is visible upon clicking the "F"
	$( "#sidebar-overlay" ).click(function() {
		toggle_sidebar();
	});

	//Disables or Enables certain classes for the HTML of the sidebar
	function toggle_sidebar () {
		$("#sidebar-overlay").toggleClass( "hidden" );
		$(".sidebar").toggleClass("sidebar-active");
		$(".container-sidebar").toggleClass("container-sidebar-active");
	}
};

//Fixes turbo links issue
$(document).ready(side_bar);
$(document).on('page:load', side_bar);