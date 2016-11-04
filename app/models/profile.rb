class Profile < ApplicationRecord
	belongs_to :user
	

	has_attached_file :profile_pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://placehold.it/150x150"
	validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\z/
end
