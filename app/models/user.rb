class User < ActiveRecord::Base
  has_secure_password
  has_many :comments
  has_many :attendees
  has_many :events
  has_many :events_joined, through: :attendees, source: :event
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :location, presence: true 
  validates :state, presence: true, length: { is: 2 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  before_validation do 
		self.email = email.downcase
	end




  
end
