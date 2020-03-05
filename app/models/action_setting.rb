class ActionSetting < ApplicationRecord
  belongs_to :challenge_subscription
  belongs_to :action

  def toggle_habit!
    self.habit = !self.habit
  end

  def toggle_checked!
    self.checked = !self.checked
  end

end
