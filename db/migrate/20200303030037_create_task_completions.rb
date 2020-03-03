class CreateTaskCompletions < ActiveRecord::Migration[5.2]
  def change
    create_table :task_completions do |t|
      t.references :challenge_subscription, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
