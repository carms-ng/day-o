class CreateActionSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :action_settings do |t|
      t.boolean :checked, default: false
      t.boolean :habit, default: false
      t.references :challenge_subscription, foreign_key: true
      t.references :action, foreign_key: true

      t.timestamps
    end
  end
end
