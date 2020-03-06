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
      # update_user_categories(action)
      redirect_to user_path(current_user)
    else
      render '/dashboard'
    end
  end

  private

  def update_user_categories(action)
    action.categories.each do |category|
      user_category = current_user.user_categories.find_by(category: category)

      new_impact = user_category.impact + action.impact
      user_category.update(impact: new_impact)

      category_points_added = user_category.category.name
      badge_category = current_user.earned_badges.first.badge.name
      if user_category.impact > 500 && badge_category != category_points_added
        badge = Badge.create!(name: category_points_added)
        @new_badge = EarnedBadge.create!(user: current_user, badge: badge)
      end
    end


  end

  # def notes(cs)

  #   # check if user has more than 500 points
  #     # check if user has the badge
  #       # if no, create badge
  #         # evaluate the action, find the category id
  #         # insert aprams into new badge before dsaving:
  #           # category, user id,
  #       # if yes, do not create badge
  #         # save action completed
  # end

  def mass_create
    current_user.action_settings.where(checked: true, habit: true).each do |setting|
      ActionCompletion.create(action: setting.action, challenge_subscription: setting.challenge_subscription)
    end
    redirect_to user_path(current_user)
  end
end
