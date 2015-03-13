class AddStateToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :state, :string
  end
end
