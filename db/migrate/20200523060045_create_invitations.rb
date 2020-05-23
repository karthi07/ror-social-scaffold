class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.references :user, foreign_key: true
      t.references :friend
      t.boolean :is_accepted

      t.timestamps
    end
    add_foreign_key :invitations, :users, column: :friend_id
  end
end
