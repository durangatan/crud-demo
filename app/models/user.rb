class User < ActiveRecord::Base
	has_many :entries, foreign_key: :author_id
	has_many :comments, foreign_key: :author_id

	include BCrypt
	def password
		@password ||= Password.new(password_hash)
	end

	def password=(input_string)
		@plaintext = input_string
		@password = 	Password.create(input_string)
		self.password_hash = @password
	end

	def authenticate(input_string)
		self.password == input_string
	end

end
