class AddAuthorNameAuthorEmailAuthorWesbsiteToAdvices < ActiveRecord::Migration
  def change
    add_column :advices, :author_name, :string
    add_column :advices, :author_email, :string
    add_column :advices, :author_website, :string
  end
end
