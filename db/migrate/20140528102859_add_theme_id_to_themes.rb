class AddThemeIdToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :theme_id, :integer
  end
end
