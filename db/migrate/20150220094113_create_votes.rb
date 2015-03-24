class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :advice
      t.boolean :is_good
      t.string :ip

      t.timestamps
    end
    add_index :votes, :user_id
    add_index :votes, :advice_id
  end
end
