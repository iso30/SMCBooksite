class User < ActiveRecord::Base
	validates :username, presence: true
	validates :password_digest, presence: true
	validates :email, presence: true
	has_many :posts
	cattr_accessor :current_user
	has_secure_password
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end
	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
		def create_remember_token
			BCrypt::Password.new(self.remember_token) == User.digest(User.new_remember_token)
		end
end
