class Product < ApplicationRecord
	has_many :sale_items
	validates_presence_of :name, :price, :active
	default_scope { where(active: true) }

	def self.search(search)
		where("name LIKE ?", "#{search}")
	end

end
