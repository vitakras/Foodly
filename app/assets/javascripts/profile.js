var profile = function () {
    //highlights the name textfiled when the page loads
    $("#member_name").focus();

    //invokes the set profile image function
	$("#member_photo").change(function(){
   		set_profile_image_preview(this);
	});

    //Sets the image of the profile image to the uploaded one
	function set_profile_image_preview(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.readAsDataURL(input.files[0]);

            reader.onload = function (e) {
        	   $('.upload-btn').css("visibility","hidden");
                $('#profile-image').css("background-image", "url(" + e.target.result +")");
            }
        }
    }
};

//Fixes turbo links issue
$(document).ready(profile);
$(document).on('page:load', profile);