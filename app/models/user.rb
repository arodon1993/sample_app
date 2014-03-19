class User < ActiveRecord::Base

	before_save { self.email = self.email.downcase }

	EMAIL_PATTERN = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

	validates :name, presence: true, length: {maximum: 50}, length: {maximum: 50}
	validates :email, presence: true, format: {with: EMAIL_PATTERN}, uniqueness: {case_sensitive: false}

	has_secure_password

	validates :password, length: {minimum: 6}
end
