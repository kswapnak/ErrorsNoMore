class PostQuestion < ActiveRecord::Base
  validates_presence_of :question, :user_id, :body
  validates_length_of :question, minimum:15
  belongs_to :user
  has_many :post_answers
end
