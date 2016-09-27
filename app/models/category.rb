class Category < ApplicationRecord
	validates :name, presence: true
	has_many :has_categories
	has_many :articulos, through: :has_categories

end
