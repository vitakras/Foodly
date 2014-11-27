
var meal = function() {

		$('.meal').on ("click", ".meal-photo", function () {
			$(this).parents('.meal').toggleClass('flip');
		});

		$('.meal').on ("click", ".box2", function () {
			$(this).parents('.meal').toggleClass('flip');
		});

	};


	//Fixes turbo links issue
	$(document).ready(meal);
	$(document).on('page:load', meal);
