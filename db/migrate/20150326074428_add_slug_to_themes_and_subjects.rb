class AddSlugToThemesAndSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :slug, :string
    add_column :themes, :slug, :string
  end
end
