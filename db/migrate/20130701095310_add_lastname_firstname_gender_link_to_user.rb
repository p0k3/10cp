class AddLastnameFirstnameGenderLinkToUser < ActiveRecord::Migration

  def up
    add_column :users, :gender, :string
    add_column :users, :lastname, :string
    add_column :users, :firstname, :string
    add_column :users, :link, :string
  end

  def down
    remove_column :users, :gender
    remove_column :users, :lastname
    remove_column :users, :firstname
    remove_column :users, :link
  end

end
