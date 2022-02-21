class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cows, through: :bookings
  has_many :cows
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
