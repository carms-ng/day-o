class Challenge < ApplicationRecord
  has_many :categories, through: :challenge_category
end
