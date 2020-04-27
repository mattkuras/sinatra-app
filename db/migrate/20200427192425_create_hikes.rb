class CreateHikes < ActiveRecord::Migration
  def change
    create_table :hikes do |t|

      t.string :location
      t.string :difficulty
      t.float :rating
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
