class AddFirstNameLastNameAboutToMembers < ActiveRecord::Migration
  def change
    add_column :members, :firstName, :string
    add_column :members, :lastName, :string
    add_column :members, :about, :string
  end
end
