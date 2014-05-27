class AddIconsToThemes < ActiveRecord::Migration
  def change
    add_attachment :themes, :icon
  end
end
