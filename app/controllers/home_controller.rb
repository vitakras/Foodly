class HomeController < ApplicationController
	#function for index.html of this controller
	#root page of the application
	#shows user ether this page or the dashboard if the user is logged in
	def index
		if member_signed_in?
			redirect_to dashboard_path
		end
	end

	#function for about.html of this controller
	#shows the about page which container the user guide
	def about
	end
end
