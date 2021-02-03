class Article < ApplicationRecord
	# validates :title, presence: true, length: {minimum: 5,maximum:10}
	validates :title, presence: true
	validates :description, presence: true
	#validates :category_id, presence: true

	serialize :category_id

	# belongs_to :category
	#has_many   :category
	has_many :category
	# belongs_to :category
	#has_and_belongs_to_many :category, foreign_key: :categoryids

	belongs_to :user
end