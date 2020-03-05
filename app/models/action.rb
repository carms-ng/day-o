class Action < ApplicationRecord
  belongs_to :challenge
  has_many :action_completions

  def setting_for(user)
    user.action_settings.find_by(action_id: id)
  end

end
