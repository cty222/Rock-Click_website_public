class CreateGrooveFolders < ActiveRecord::Migration
  def change
    create_table :groove_folders do |t|
      t.string :name
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
