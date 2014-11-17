class User < ActiveRecord::Base
	attr_accessor :password

	has_and_belongs_to_many :organizations

	validates 	:username,	:presence	=> true,
				:length					=> { :maximum => 50 }

	validates	:password,	:presence	=> true,
				:confirmation 			=> true,
				:length					=> { :within => 5..40 }

	before_save :encrypt_password

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :encrypted_password)
	end

	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end

	def self.authenticate(username, submitted_password)
		user = find_by_username(username)

		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end

	private
	def encrypt_password
		self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{password}") if self.new_record?
		self.encrypted_password = encrypt(password)
	end

	def encrypt(password)
		Digest::SHA2.hexdigest("#{self.salt}--#{password}")
	end
end
