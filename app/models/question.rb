class Question < ActiveRecord::Base
	has_many :answers

	belongs_to :user

	validates :content, presence: true, length: { maximum: 140 }

    validates :user_id, presence: true
end
