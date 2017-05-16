class RegisteredApplication < ActiveRecord::Base
  belongs_to :user

  validates_uniqueness_of :url
  validates_uniqueness_of :name
  
end
