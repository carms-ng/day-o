class Action < ApplicationRecord
  belongs_to :challenge

  has_many :action_completions, dependent: :destroy
  has_many :action_categories, dependent: :destroy
  has_many :action_settings, dependent: :destroy

  has_many :categories, through: :action_categories

  def setting_for(user)
    user.action_settings.find_by(action_id: id)
  end

end
