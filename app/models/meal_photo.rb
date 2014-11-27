class MealPhoto < ActiveRecord::Base
	#relationships
	belongs_to :meal

	#paperclip
  has_attached_file :photo, :presence => true,
	:url => "/files/:class/:attachment/:id/:style/:basename.:extension",
	:path => ":rails_root/public/files/:class/:attachment/:id/:style/:basename.:extension",
	:styles  => { :small => "200x200", :large => "1500x1500>" }

	#validations
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def private
    params.require(:meal_photo).permit(:member_id, :photo)
  end

end
