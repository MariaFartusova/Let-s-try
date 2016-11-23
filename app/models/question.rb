class Question < ActiveRecord::Base
	has_many :answers
	
	belongs_to :user
  
	validates :content, :user_id, presence: true, presence: true, length: { maximum: 140 }
end
