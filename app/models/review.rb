class Review < ApplicationRecord
  belongs_to :caravan
  belongs_to :user
  validates :rating, presence: true
  validates :content, length: { minimum: 20 }
end
