class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :challenge_subscriptions
  has_many :action_completions, through: :challenge_subscriptions
  has_many :action_settings, through: :challenge_subscriptions
  has_many :earned_badges, dependent: :destroy
  has_many :badges, through: :earned_badges
  has_many :user_categories, dependent: :destroy

  after_create :initialize_user_categories

  def initialize_user_categories
    Category.all.each do |category|
      UserCategory.create(user: self, category: category, impact: 0)
    end
  end
end
