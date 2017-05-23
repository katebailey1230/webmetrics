class Event < ActiveRecord::Base
  belongs_to :registered_applications

  validates :registered_applications, presence: true
end
