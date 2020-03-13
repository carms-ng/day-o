class ActionCompletion < ApplicationRecord
  belongs_to :challenge_subscription
  belongs_to :action

  after_create :update_user_categories

  def impact
    self.action.impact
  end

  def user
    challenge_subscription.user
  end

  private

  def update_user_categories
    action.categories.each do |category|
      user_category = user.user_categories.find_by(category: category)

      new_impact = user_category.impact + action.impact
      user_category.update(impact: new_impact)

      category_name = user_category.category.name
      badge = Badge.find_by(name: category_name)
      existing_user_badge = user.earned_badges.find_by(badge: badge)
      if user_category.impact > 3000 && existing_user_badge.nil?
        new_badge = EarnedBadge.create!(user: user, badge: badge)
      end
    end
  end
end
