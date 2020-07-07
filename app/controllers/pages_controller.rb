class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :mass_create?, only: [:habit]
  before_action :num_habit_checkable, only: [:habit]
  before_action :num_habit_checked, only: [:habit]

  def home
  end

  def dashboard
    @link_active = "dashboard"
    @incomplete_sub = current_user.challenge_subscriptions.order(:created_at).to_a.select do |sub|
      sub.num_actions_habit != sub.challenge.actions.count
    end
  end

  def habit
    @habits = ActionSetting.joins(:challenge_subscription)
      .where(challenge_subscriptions: { user_id: current_user.id }, action_settings: { habit: true })
    @link_active = "habit"
  end

  private

  def mass_create?
    @can_mass_create = current_user.action_settings.to_a.any? do |as|
      as.checked && !as.done_today? && as.habit
    end
  end

  def num_habit_checkable
    @num_habit_checkable = current_user.action_settings.to_a.count do |as|
      !as.done_today? && as.habit
    end
  end

  def num_habit_checked
    @num_habit_checked = current_user.action_settings.to_a.count do |as|
      as.checked && !as.done_today? && as.habit
    end
  end
end
