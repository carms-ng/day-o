class Challenge < ApplicationRecord
  has_many :categories, through: :challenge_categories
  belongs_to :challenge_subscriptions
end
