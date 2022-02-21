class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cow
  has_many :cows
  has_many :users
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :cow, uniqueness: { scope: :start_date }
  validates :cow, uniqueness: { scope: :end_date }
end
