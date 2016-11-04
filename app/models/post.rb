class Post < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_and_belongs_to_many :categories

	validates_presence_of :title
	validates_presence_of :body

	# geocoded_by :ip_address,
 #  		:latitude => :lat, :longitude => :lon
	# after_validation :geocode
end
