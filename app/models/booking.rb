class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cow
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :cow, uniqueness: { scope: :start_date }
  validates :cow, uniqueness: { scope: :end_date }
  enum status: { pending: 0, confirmed: 1, declined: 2 }
end
