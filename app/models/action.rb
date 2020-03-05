class Action < ApplicationRecord
  belongs_to :challenge
  has_many :action_completions
<<<<<<< HEAD
  has_many :action_categories
  has_many :categories, through: :action_categories
=======

  def setting_for(user)
    user.action_settings.find_by(action_id: id)
  end

>>>>>>> 36a240eaabf6d338f05dc4feeee457139efede60
end
