class Caravan < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: {min: 8}
  validates :address, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :number_of_guests, presence: true, numericality: { only_integer: true }

  belongs_to :user
end
