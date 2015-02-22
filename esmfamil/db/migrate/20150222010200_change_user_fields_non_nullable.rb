class ChangeUserFieldsNonNullable < ActiveRecord::Migration

  def change
  	change_column :users, :nickname, :string, :null => false
  end
end
