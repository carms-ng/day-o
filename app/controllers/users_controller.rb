class UsersController < ApplicationController
  def show
    # Should other user be able to see your profile page?
    # @user = current_user
    @user = User.find(params[:id])

    # actions_today = ActionCompletion.joins(:challenge_subscription)
    #   .where(challenge_subscriptions: { user_id: @user.id} )
    #   .where("action_completions.created_at > ?", 1.day.ago)
    # @impact_today = actions_today.to_a.sum { |action| action.impact }

    @impact_week_hash = weekly
    @impact_month_hash = monthly
    @impact_all_time_hash = all_time

    # 7 is today
    @impact_today = @impact_week_hash[Date.today.strftime("%b%e")]
  end

  private

  def weekly
    actions_week = ActionCompletion.joins(:challenge_subscription)
      .where(challenge_subscriptions: { user_id: @user.id} )
      .where("action_completions.created_at > ?", 1.week.ago)

    daily_impact = ((Date.today - 6)..Date.today).to_a.each.map { |day, index| [day, 0] }.to_h

    actions_week.each do |action|
      daily_impact[action.created_at.in_time_zone('Eastern Time (US & Canada)').to_date] += action.impact
    end

    # Take hash of { date => impact } and convert to { date_string => impact }
    daily_impact.map { |date_and_impact| [date_and_impact[0].strftime("%b%e"), date_and_impact[1]] }.to_h
  end

  def monthly
    actions_monthly = ActionCompletion.joins(:challenge_subscription)
      .where(challenge_subscriptions: { user_id: @user.id} )
      .where("action_completions.created_at > ?", 1.month.ago)

    daily_impact = ((Date.today - 29)..Date.today).to_a.each.map { |day, index| [day, 0] }.to_h

    actions_monthly.each do |action|
      daily_impact[action.created_at.in_time_zone('Eastern Time (US & Canada)').to_date] += action.impact
    end

    # Take hash of { date => impact } and convert to { date_string => impact }
    daily_impact.map { |date_and_impact| [date_and_impact[0].strftime("%b%e"), date_and_impact[1]] }.to_h

  end

  def all_time
    start_date = [current_user.created_at, Date.today - 29].min

    actions_monthly = ActionCompletion.joins(:challenge_subscription)
      .where(challenge_subscriptions: { user_id: @user.id} )
      .where("action_completions.created_at > ?", start_date)

    daily_impact = (start_date..Date.today).to_a.each.map { |day, index| [day, 0] }.to_h

    actions_monthly.each do |action|
      daily_impact[action.created_at.in_time_zone('Eastern Time (US & Canada)').to_date] += action.impact
    end

    # Take hash of { date => impact } and convert to { date_string => impact }
    daily_impact.map { |date_and_impact| [date_and_impact[0].strftime("%b%e"), date_and_impact[1]] }.to_h

  end
end
