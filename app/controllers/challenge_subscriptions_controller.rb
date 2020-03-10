class ChallengeSubscriptionsController < ApplicationController

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @sub = ChallengeSubscription.new(user: current_user, challenge: @challenge)

    if @sub.save
      redirect_to dashboard_path
    else
      render 'challenges/show'
    end
  end
end
