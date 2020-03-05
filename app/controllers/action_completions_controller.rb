class ActionCompletionsController < ApplicationController
  def create
    action = Action.find(params[:action_id])
    # my_challenge = act.challenge
    # cs = ChallengeSubscription.where(challenge_id: my_challenge.id, user_id: current_user.id)
    # @ac = ActionCompletion.new(challenge_subscription: cs[0], action: action)

    subs = ChallengeSubscription.joins(challenge: :actions)
      .find_by(challenge_subscriptions: { user_id: current_user.id }, actions: { id: action.id} )
    @completed_action = ActionCompletion.new(challenge_subscription: subs, action: action)

    if @completed_action.save
      redirect_to user_path(current_user)
    else
      render '/dashboard'
    end
  end

  def mass_create
    current_user.action_settings.where(checked: true, habit: true).each do |setting|
      ActionCompletion.create(action: setting.action, challenge_subscription: setting.challenge_subscription)
    end
    redirect_to user_path(current_user)
  end
end
