class Article < ApplicationRecord
	# validates :title, presence: true, length: {minimum: 5,maximum:10}
	validates :title, presence: true
	validates :description, presence: true

	belongs_to :user
end