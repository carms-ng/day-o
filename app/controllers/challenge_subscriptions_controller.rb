class ChallengeSubscriptionsController < ApplicationController
  def create
    @challenge = Challenge.find(params[:challenge_id])
    @sub = ChallengeSubscription.new(user: current_user, challenge: @challenge)

    if @sub.save
      @challenge.actions.each do |action|
        ActionSetting.create(challenge_subscription: @sub, action: action)
      end
      redirect_to dashboard_path
    else
      render 'challenges/show'
    end
  end
end
