class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @habits = ActionSetting.joins(:challenge_subscription)
      .where(challenge_subscriptions: { user_id: current_user.id }, action_settings: { habit: true })
  end
end
