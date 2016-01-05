class CreateInstrumentBundles < ActiveRecord::Migration
  def change
    create_table :instrument_bundles do |t|
      t.string :name
      t.boolean :enable, default:false ,null:false
      t.boolean :delete_lock, default:false ,null:false
      t.belongs_to :user
      t.belongs_to :percussion_instrument_0
      t.belongs_to :percussion_instrument_1
      t.belongs_to :percussion_instrument_2
      t.belongs_to :percussion_instrument_3
      t.belongs_to :percussion_instrument_4
      t.belongs_to :percussion_instrument_5
      t.belongs_to :percussion_instrument_6
      t.belongs_to :percussion_instrument_7
      t.belongs_to :percussion_instrument_8
      t.belongs_to :percussion_instrument_9
      t.belongs_to :percussion_instrument_10
      t.belongs_to :percussion_instrument_11
      t.belongs_to :percussion_instrument_12
      t.belongs_to :percussion_instrument_13
      t.belongs_to :percussion_instrument_14
      t.belongs_to :percussion_instrument_15
      t.timestamps null: false
    end
  end
end
