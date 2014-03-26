class AddThemeIdToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :theme_id, :integer
  end
end
