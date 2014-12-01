class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :perl

  protected

  #allows the devise gem to accept firstName, lastName and username
  #variables when a user is creating an account
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :firstName
    devise_parameter_sanitizer.for(:sign_up) << :lastName
  end

  #calls the perl script and saves its data 
  #to meet two server-side technology requirement 
  def perl
    @perltime = `perl "#{Rails.root}/public/time.pl"`
  end
end
