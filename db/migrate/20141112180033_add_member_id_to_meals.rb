class AddMemberIdToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :member_id, :integer
  end
end
