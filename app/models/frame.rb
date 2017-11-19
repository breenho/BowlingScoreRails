class Frame < ApplicationRecord
	has_one :try

	def next
	Frame.where("id > ?", id).first
	end

	def previous
	Frame.where("id < ?", id).last
	end
end