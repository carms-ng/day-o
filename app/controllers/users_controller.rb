class UsersController < ApplicationController
  def show
    # Should other user be able to see your profile page?
    # @user = current_user
    @user = User.find(params[:id])

    # actions_today = ActionCompletion.joins(:challenge_subscription)
    #   .where(challenge_subscriptions: { user_id: @user.id} )
    #   .where("action_completions.created_at > ?", 1.day.ago)
    # @impact_today = actions_today.to_a.sum { |action| action.impact }

    actions_week = ActionCompletion.joins(:challenge_subscription)
      .where(challenge_subscriptions: { user_id: @user.id} )
      .where("action_completions.created_at > ?", 1.week.ago)

    daily_impact = ((Date.today - 7)..Date.today).to_a.map { |day| [ day, 0 ] }.to_h

    actions_week.each do |action|
      daily_impact[action.created_at.to_date] += action.impact
    end

    @impact_week_hash = daily_impact
    @impact_today = @impact_week_hash[Date.today]

  end
end
