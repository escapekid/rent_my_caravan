class Review < ApplicationRecord
  belongs_to :caravan
  belongs_to :user

  validates :content, presence: true

end
