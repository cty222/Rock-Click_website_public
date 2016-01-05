class CreateGrooveCategories < ActiveRecord::Migration
  def change
    create_table :groove_categories do |t|
      t.string :name
      t.boolean :enable, default:false ,null:false
      t.boolean :delete_lock, default:false ,null:false
      t.timestamps null: false
    end
  end
end
