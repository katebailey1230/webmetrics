class User < ActiveRecord::Base
has_many :registered_applications


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
