class BuddyChallenge < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :sender_subscription, class_name: 'ChallengeSubscription', optional: true
  belongs_to :receiver_subscription, class_name: 'ChallengeSubscription', optional: true
  belongs_to :challenge

  def user_is_sender(user)
    self.sender == user
  end

  def user_is_receiver(user)
    self.receiver == user
  end
end
