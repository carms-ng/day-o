class ChallengeSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :action_completions
end
