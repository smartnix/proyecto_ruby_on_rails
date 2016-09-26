class Articulo < ApplicationRecord
	belongs_to :user
	has_many :comments 
	validates :titulo, presence: true, uniqueness: true
	validates :body, presence: true, length: { minimum: 20 }
	before_save :set_visits_count

	has_attached_file :cover, styles: { medium: "1280x720", thumb: "800x600" , min:"400x300" }
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

	#validates_attachment :cover, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

	def update_visits_count	
		self.update(visits_count: self.visits_count + 1)
	end
	private
	def set_visits_count
		self.visits_count ||= 0
	end
end
