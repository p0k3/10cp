class AddInvalidationReasonToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :invalidation_reason, :string
  end
end
