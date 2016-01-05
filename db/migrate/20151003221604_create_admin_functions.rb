class CreateAdminFunctions < ActiveRecord::Migration
  def change
    create_table :admin_functions do |t|
      t.string :name, null: false
      t.string :magic_number, null: false
      t.boolean :enable, default: true, null: false
      t.timestamps null: false
    end
  end
end
