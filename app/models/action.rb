class Action < ApplicationRecord
  belongs_to :challenge
  has_many :action_completions
  has_many :challenge_categories
  has_many :categories, through: :action_categories
end
