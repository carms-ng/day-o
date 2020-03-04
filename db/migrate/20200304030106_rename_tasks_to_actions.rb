class RenameTasksToActions < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :emission, :impact
    add_column :tasks, :recurring, :boolean, default: true
    rename_table :tasks, :actions

    remove_column :task_completions, :task_id
    add_reference :task_completions, :action, index: true
    rename_table :task_completions, :action_completions
  end
end
