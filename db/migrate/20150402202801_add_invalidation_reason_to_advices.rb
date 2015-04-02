class AddInvalidationReasonToAdvices < ActiveRecord::Migration
  def change
    add_column :advices, :invalidation_reason, :string
  end
end
