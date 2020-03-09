class CreateBuddyChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :buddy_challenges do |t|
      t.boolean :status
      t.references :sender_subscription, foreign_key: {to_table: 'challenge_subscriptions'}
      t.references :receiver_subscription, foreign_key: {to_table: 'challenge_subscriptions'}
      t.references :sender, foreign_key: {to_table: 'users'}
      t.references :receiver, foreign_key: {to_table: 'users'}
      t.references :challenge, foreign_key: true
      t.timestamps
    end
  end
end
