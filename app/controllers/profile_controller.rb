class ProfileController < ApplicationController
	#Functions called each time this controller is invoked before loading 
	before_action :authenticate_member!, only: [:edit, :index]
	before_action :load_params, only: [:show, :edit]
	
	#function for index.html of this controller
	#redirects to the show function
	def index
		redirect_to show_profile_path(current_member.id)
	end

	#function for show.html of this controller
	#loads user and the user meal cards
	def show
		@meals = @member.meals;
	end

	#function for edit.html of this controller
	#lets the user edit his profile 
	def edit 
	end

	#function to handle post request from edit profile 
	#updates the currently logged in user
	def update
		current_member.update(profile_params)

		respond_to do |format|
      		format.html {redirect_to action: 'index'}
     	end
	end

	private

		#load required variables for this controller 
		def load_params
			@member = Member.find(params[:id])
			@member.name = "#{@member.firstName.capitalize} #{@member.lastName.capitalize}"
			
			#redirects user to root url if user is not found
			rescue ActiveRecord::RecordNotFound
				redirect_to(root_url)
		end

		#restricts the model to update only {firstName,lastName,about,photo}
		#variables of the model
		def profile_params
			name = params[:member].extract!(:name)
			name = name[:name].split(" ")

			#prevents nil error
			params[:member][:firstName] = name[0] == nil ? "" : name[0]
			params[:member][:lastName] = name[1] == nil ? "" : name[1]

			params.require(:member).permit(:firstName,
				:lastName,:about,:photo)
		end
end
