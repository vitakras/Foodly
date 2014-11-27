class ChangeMemberAbout < ActiveRecord::Migration
  def change
  	remove_column :members, :about
  	add_column :members, :about, :text
  end
end
