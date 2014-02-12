class AddPhoto < ActiveRecord::Migration
  def change
  add_column :profiles, :picture,:string
  end
end
