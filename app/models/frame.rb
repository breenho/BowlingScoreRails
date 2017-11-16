class Frame < ApplicationRecord
  belongs_to :game
  has_one :try
end