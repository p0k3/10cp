class CreateAdvices < ActiveRecord::Migration
  def up
    create_table :advices do |t|
      t.string :title
      t.text :description
      t.integer :subject_id
      
      t.timestamps
    end
  end

  def down
    drop_table :advices
  end
end
