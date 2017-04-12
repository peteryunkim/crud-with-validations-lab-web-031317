class Song < ActiveRecord::Base
	validates :title, presence: true
	validates_uniqueness_of :title, {:scope => [:artist_name, :release_year]}
	validates :artist_name, presence: true
	validates :released, inclusion: { in: [true, false] }
	with_options if: :released? do |x|
		x.validates :release_year, presence: true
		x.validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}
	end
	





end



