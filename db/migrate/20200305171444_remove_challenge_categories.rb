class RemoveChallengeCategories < ActiveRecord::Migration[5.2]
  def change
    drop_table :challenge_categories
  end
end
