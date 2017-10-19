class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :attendees
  has_many :users_attending, through: :attendees, source: :user
  validates :date, date: { after: Proc.new {Time.now} }
  validates :date, presence: true 
  validates :name, :location, :state, presence: true
end
