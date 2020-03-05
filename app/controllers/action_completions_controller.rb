class ActionCompletionsController < ApplicationController
  def create
    act = Action.find(params[:action_id])
    my_challenge = act.challenge
    cs = ChallengeSubscription.where(challenge_id: my_challenge.id, user_id: current_user.id)
    @ac = ActionCompletion.new(challenge_subscription: cs[0], action: action)

    # subs = ChallengeSubscription.joins(:challenge, :action)
    #   .where(challenge_subscriptions: { user_id: current_user.id }, actions: { id: action.id} )
    # @completed_action = ActionCompletion.new(challenge_subscription: subs[0], action: action)

    if @ac.save
      redirect_to user_path(current_user)
    else
      render '/dashboard'
    end
  end
end

    # @reviews_received = Review.joins(booking: :service).where(services: { user_id: @user.id })
