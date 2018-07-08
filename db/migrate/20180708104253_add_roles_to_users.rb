class AddRolesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :moderator, :boolean, default: false
    add_column :users, :fresh, :boolean, default: true
  end
end
