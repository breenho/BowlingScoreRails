class Game < ApplicationRecord
  belongs_to :user
  has_many :frames
  validates :frames, length: {maximum: 10}
end
