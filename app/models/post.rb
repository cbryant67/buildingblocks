class Post < ActiveRecord::Base
	
extend FriendlyId
friendly_id :title, use: [:finders]

has_attached_file :image

validates_attachment :image,
content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

end
