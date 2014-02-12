class RemoveUserDisplayNameFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :user_display_name
  end
end
