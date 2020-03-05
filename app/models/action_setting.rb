class ActionSetting < ApplicationRecord
  belongs_to :challenge_subscription
  belongs_to :action

  def toggle_habit!
    self.habit = !self.habit
  end

  def toggle_checked!
    self.checked = !self.checked
  end

  def done_today?
    year = Time.now.year
    month = Time.now.month
    day = Time.now.day
    start_day = "#{year}-#{month}-#{day}T00:00EST"
    ActionCompletion.where(action_id: self.action_id, challenge_subscription_id: self.challenge_subscription_id)
      .where('created_at > ?', start_day).exists?
  end
end
