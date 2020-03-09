class ChallengeSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :action_completions, dependent: :destroy
  has_many :action_settings, dependent: :destroy
  has_many :sent_challenges, class_name: 'BuddyChallenge', foreign_key: 'sender_subscription_id', dependent: :destroy
  has_many :received_challenges, class_name: 'BuddyChallenge', foreign_key: 'receiver_subscription_id', dependent: :destroy
  after_create :create_action_setting

  def num_actions_done
    (self.action_completions.map { |ac| ac.action }).uniq.count
  end

  def num_actions_habit
    self.action_settings.count { |as| as.habit == true }
  end
  # def percentage_done
  #   num_action_done.to_f / self.challenge.actions.count
  # end
  def create_action_setting
    challenge.actions.each do |action|
      ActionSetting.create(challenge_subscription: self, action: action)
    end
  end
end
