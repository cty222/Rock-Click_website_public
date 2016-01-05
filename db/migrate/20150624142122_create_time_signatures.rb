class CreateTimeSignatures < ActiveRecord::Migration
  def change
    create_table :time_signatures do |t|
      t.string :name, null:false
      t.integer :lower_numeral, null:false  
      t.integer :upper_numeral, null:false  
      t.boolean :enable, null:false
      t.boolean :delete_lock, default:false ,null:false
      t.timestamps null: false
    end
  end
end
