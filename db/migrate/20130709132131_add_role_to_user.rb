class AddRoleToUser < ActiveRecord::Migration
  def up
    add_column :users, :role, :string
    User.update_all(role: "user")
  end

  def down
    remove_column :users, :role
  end
end
