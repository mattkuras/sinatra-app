class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.timestamps null: false
      t.integer :user_id
      t.integer :hike_id
    end
  end
end
