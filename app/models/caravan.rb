class Caravan < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 8 }
  validates :address, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :number_of_guests, presence: true, numericality: { only_integer: true }
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :reviews, through: :bookings
end
