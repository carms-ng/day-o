class Category < ApplicationRecord
  has_many :action_categories, dependent: :destroy
  has_many :actions, through: :action_categories
end
