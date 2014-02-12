class AddColoumnNumberOfVotesToPostAnswers < ActiveRecord::Migration
  def change
  	add_column :post_answers, :number_of_votes, :integer, :default => 0
  end
end
