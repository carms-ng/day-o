class Action < ApplicationRecord
  belongs_to :challenge
  has_many :action_completions
end
