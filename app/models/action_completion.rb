class ActionCompletion < ApplicationRecord
  belongs_to :challenge_subscription
  belongs_to :action

  def impact
    self.action.impact
  end
end
