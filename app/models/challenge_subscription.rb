class ChallengeSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :action_completions, dependent: :destroy
  has_many :action_settings, dependent: :destroy

  def num_actions_done
    (self.action_completions.map { |ac| ac.action }).uniq.count
  end

  # def percentage_done
  #   num_action_done.to_f / self.challenge.actions.count
  # end
end
