class CreatePercussionInstruments < ActiveRecord::Migration
  def change
    create_table :percussion_instruments do |t|
      t.string :name, null:false
      t.string :voice, null:false
      t.integer :location, null:false
      t.boolean :enable, default:false ,null:false
      t.boolean :delete_lock, default:false ,null:false
      t.timestamps null: false
    end
  end
end
