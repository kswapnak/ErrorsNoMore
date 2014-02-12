class AddUserIdPostAnswers < ActiveRecord::Migration
  def change
  	add_column :post_answers, :user_id, :integer
  end
end
