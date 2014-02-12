class CreatePostQuestions < ActiveRecord::Migration
  def change
    create_table :post_questions do |t|
      t.string :question
      t.integer :user_id

      t.timestamps
    end
  end
end
