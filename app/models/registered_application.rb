class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy

validates :user, presence: true
validates :events, presence: true
end
