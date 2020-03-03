class Category < ApplicationRecord
  belongs_to :challenge, through: :challenge_category
end
