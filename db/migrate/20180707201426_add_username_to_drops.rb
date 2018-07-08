class AddUsernameToDrops < ActiveRecord::Migration[5.2]
  def change
    add_reference :drops, :user, foreign_key: true
  end
end
