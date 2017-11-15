class Frame < ApplicationRecord
  belongs_to :game
  has_many :tries
  validates :tries, length: {maximum: 2}
end
