class CreateRoleAndAdminFunctions < ActiveRecord::Migration
  def change
    create_table :role_and_admin_functions do |t|
      t.belongs_to :role, index: true, null: false
      t.belongs_to :admin_function, index: true, null: false
      t.timestamps null: false
    end
  end
end
