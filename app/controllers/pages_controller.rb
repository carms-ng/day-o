class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  before_action :mass_create?, only: [:habit]


  def home
  end

  def dashboard
  end

  def habit
    @habits = ActionSetting.joins(:challenge_subscription)
      .where(challenge_subscriptions: { user_id: current_user.id }, action_settings: { habit: true })
  end

  private

  def mass_create?
    @can_mass_create = current_user.action_settings.to_a.any? do |as|
      as.checked && !as.done_today?
    end

  end
end
