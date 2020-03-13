class ActionCompletionsController < ApplicationController

  def create
    action = Action.find(params[:action_id])
    # my_challenge = act.challenge
    # cs = ChallengeSubscription.where(challenge_id: my_challenge.id, user_id: current_user.id)
    # @ac = ActionCompletion.new(challenge_subscription: cs[0], action: action)

    subs = ChallengeSubscription.joins(challenge: :actions)
      .find_by(challenge_subscriptions: { user_id: current_user.id }, actions: { id: action.id} )
    @completed_action = ActionCompletion.create(challenge_subscription: subs, action: action)

    if @completed_action.save
      as = @completed_action.challenge_subscription.action_settings.find_by(action: action)
      if as.habit
        redirect_to habit_path
      else
        update_user_categories(action)
        # redirect_to dashboard_path
        respond_to do |format|
          format.html { render 'pages/dashboard' }
          format.js  # <-- idem
        end
        # flash[:notice] = "Checked! Wanna make it a habit?"
      end
    else
      render '/dashboard'
    end
  end

  def mass_create
    new_impact = 0
    current_user.action_settings.where(checked: true, habit: true).each do |setting|
      if !setting.done_today?
        new_impact += setting.action.impact
        ActionCompletion.create(action: setting.action, challenge_subscription: setting.challenge_subscription)
      end
    end
    render json: { new_impact: new_impact }
  end

  private

  def update_user_categories(action)
    action.categories.each do |category|
      user_category = current_user.user_categories.find_by(category: category)

      new_impact = user_category.impact + action.impact
      user_category.update(impact: new_impact)

      category_name = user_category.category.name
      badge = Badge.find_by(name: category_name)
      existing_user_badge = current_user.earned_badges.find_by(badge: badge)
      if user_category.impact > 10000 && existing_user_badge.nil?
        new_badge = EarnedBadge.create!(user: current_user, badge: badge)
      end
    end


  end

end
