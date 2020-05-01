class AddColumnsToHikes < ActiveRecord::Migration
  def change
    add_column :hikes, :location, :string
    add_column :hikes, :description, :string
  end
end
