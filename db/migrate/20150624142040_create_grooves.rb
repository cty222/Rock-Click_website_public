class CreateGrooves < ActiveRecord::Migration
  def change
    create_table :grooves do |t|
      t.string :name, null:false
      t.string :track_0
      t.string :track_1
      t.string :track_2
      t.string :track_3
      t.string :track_4
      t.string :track_5
      t.string :track_6
      t.string :track_7
      t.string :track_8
      t.string :track_9
      t.string :track_10
      t.string :track_11
      t.string :track_12
      t.string :track_13
      t.string :track_14
      t.string :track_15
      t.integer :total_bar, default:1, null:false
      t.boolean :enable, default:false, null:false
      t.boolean :delete_lock, default:false ,null:false
      t.belongs_to :user, null:false
      t.belongs_to :instrument_bundle, null:false
      t.belongs_to :time_signature, null:false
      t.belongs_to :groove_categories
      t.belongs_to :groove_folder
      t.timestamps null: false
    end
  end
end
