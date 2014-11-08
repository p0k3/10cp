class AddUserIdToSubjectAndAdvice < ActiveRecord::Migration
  def up
    add_column :advices, :user_id, :integer
    add_column :subjects, :user_id, :integer
  end

  def down
    remove_column :advices, :user_id
    remove_column :subjects, :user_id
  end
end
