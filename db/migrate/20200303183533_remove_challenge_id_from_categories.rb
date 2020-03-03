class RemoveChallengeIdFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :challenge_id
  end
end
