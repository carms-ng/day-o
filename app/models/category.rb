class Category < ApplicationRecord
  has_many :challenge_categories, dependent: :destroy
  has_many :challenge, through: :challenge_categories
end
