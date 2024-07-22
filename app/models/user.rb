class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post
  validates :username, length: { minimum: 4 }
  validates :password, length: { minimum: 6 }
  validates :email, presence: true
end
