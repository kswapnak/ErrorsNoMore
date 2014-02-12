class PostAnswer < ActiveRecord::Base
  validates_presence_of :answer, :post_question_id
  belongs_to :post_question
  belongs_to :user
end
