class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthdate, :date
    add_column :users, :town, :string
    add_column :users, :job, :string
    add_column :users, :biography, :text
  end
end
