class Meal < ActiveRecord::Base
	#relationships
	has_many :meal_photos, :dependent => :destroy
	belongs_to :member

  accepts_nested_attributes_for :meal_photos

	#validations
  validates_associated :meal_photos
end
