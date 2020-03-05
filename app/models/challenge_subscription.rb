class ChallengeSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :action_completions, dependent: :destroy
  has_many :action_settings, dependent: :destroy
end
