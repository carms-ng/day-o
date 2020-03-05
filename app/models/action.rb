class Action < ApplicationRecord
  belongs_to :challenge
  has_many :action_completions
  has_many :action_categories
  has_many :categories, through: :action_categories
  has_many :action_settings, dependent: :destroy

  def setting_for(user)
    user.action_settings.find_by(action_id: id)
  end

end
