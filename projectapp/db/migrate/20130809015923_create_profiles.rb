class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :reputation_points
      t.integer :user_id

      t.timestamps
    end
  end
end
