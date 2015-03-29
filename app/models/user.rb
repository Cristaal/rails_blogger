class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  validates :email, :presence => true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
