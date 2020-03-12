class Challenge < ApplicationRecord
  has_many :challenge_subscriptions, dependent: :destroy
  has_many :actions, dependent: :destroy
  has_many :buddy_challenges, dependent: :destroy

  def total_impact
    self.actions.sum { |action| action.impact }
  end
end
