class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true

  has_many :challenge_subscriptions
  has_many :action_completions, through: :challenge_subscriptions

  has_many :action_settings, through: :challenge_subscriptions

  has_many :earned_badges, dependent: :destroy
  has_many :badges, through: :earned_badges

  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories

  has_many :sent_challenges, class_name: 'BuddyChallenge', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_challenges, class_name: 'BuddyChallenge', foreign_key: 'receiver_id', dependent: :destroy


  after_create :initialize_user_categories, :initialize_challenge_subscription

  def initialize_user_categories
    Category.all.each do |category|
      UserCategory.create(user: self, category: category, impact: 0)
    end
  end

  def initialize_challenge_subscription
    starter = Challenge.find_by(name: "Starter Pack")
    ChallengeSubscription.create(user: self, challenge: starter)
  end

  def give_notification
    self.update(notification_count: notification_count + 1)
  end

  def clear_notifications
    self.update(notification_count: 0)
  end

  def relationship_to_latest_buddy_challenge
    last_sent =  self.sent_challenges.last
    last_received =  self.received_challenges.last

    if (
      (last_sent && !last_received) ||
      (last_sent && last_received && last_sent.created_at > last_received.created_at)
    )
      return "sent"
    elsif (
      (last_received && !last_sent) ||
      (last_received && last_sent && last_sent.created_at < last_received.created_at)
    )
      return "received"
    else
      return false
    end
  end
end
