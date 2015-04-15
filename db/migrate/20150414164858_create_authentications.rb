class CreateAuthentications < ActiveRecord::Migration
  def change
    drop_table :authorizations
    create_table :authentications do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :token

      t.timestamps
    end
  end
end
