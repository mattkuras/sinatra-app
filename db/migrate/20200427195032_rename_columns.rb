class RenameColumns < ActiveRecord::Migration
  def change
    rename_column :hikes, :location, :name
  end
end
