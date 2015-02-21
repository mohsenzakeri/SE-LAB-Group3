class AddFieldsToUser < ActiveRecord::Migration
  def change
	add_column("users", "firstname", :string)
	add_column("users", "lastname", :string)
	add_column("users", "nickname", :string)
	add_column("users", "birthdate", :string)
  end
end
