class Category < ApplicationRecord
 	
 	before_save {self.name = name.downcase}

 	validates :name, presence: true

 	validates_uniqueness_of :name	

 	has_many :articles, dependent: :destroy
end