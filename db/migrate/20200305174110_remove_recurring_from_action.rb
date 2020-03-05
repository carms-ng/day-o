class RemoveRecurringFromAction < ActiveRecord::Migration[5.2]
  def change
    remove_column :actions, :recurring, :boolean
  end
end
