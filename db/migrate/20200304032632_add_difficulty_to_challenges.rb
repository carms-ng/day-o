class AddDifficultyToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :difficulty, :integer
  end
end
