class Category < ApplicationRecord
  has_many :challenge_categories, dependent: :destroy

end
