class Member < ActiveRecord::Base
  attr_accessor :name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #paperclip
  has_attached_file :photo,
  :url => "/files/:class/:attachment/:id/:style/:basename.:extension",
  :path => ":rails_root/public/files/:class/:attachment/:id/:style/:basename.:extension",
  :styles  => { :small => "200x200#", :large => "700x700>"}, 
  :default_url => "/public/profile.png"

  #validations
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  #Associations
  has_many :meals
end
