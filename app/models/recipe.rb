class Recipe < ActiveRecord::Base
	validates :name, presence: true
	validates :name, length: { minimum: 5}

	validates :instructions, presence: true
	validates :instructions, length: { minimum: 20 }

	validates :minutes_to_prepare, presence: true
	validates :minutes_to_prepare, numericality: { only_integer: true, greater_than: 0 }

	validates :minutes_to_cook, presence: true
	validates :minutes_to_prepare, numericality: { only_integer: true, greater_than: 0 }

	def total_time(minutes_to_prepare, minutes_to_cook)
		minutes_to_prepare + minutes_to_cook
	end
end
