class Comment < ActiveRecord::Base
	belongs_to :entry
	belongs_to :author, class_name: :User, foreign_key: :author_id

end
