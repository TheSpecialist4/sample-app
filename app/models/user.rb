# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

class User < ApplicationRecord

	# inbuilt rails function to authenticate passwords and 
	# checks with password_digest column in db. Col name predefined
	# has built in authenticate function to authenticate user with
	# supplied password
	has_secure_password

	before_save { |user| user.email = email.downcase }

	validates(:name, presence: true, length: {maximum: 50})
	validates :email, presence: true, uniqueness: { case_sensitive: false}
	validates :password, presence: true, length: {minimum: 6}
	validates :password_confirmation, presence: true
end
