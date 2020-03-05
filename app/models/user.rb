class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :challenge_subscriptions
  has_many :action_completions, through: :challenge_subscriptions
  has_many :action_settings, through: :challenge_subscriptions
end
