class CreateSystemAdminUserAndRoles < ActiveRecord::Migration
  def change
    create_table :system_admin_user_and_roles do |t|
      t.belongs_to :system_admin_user, index: true, null: false
      t.belongs_to :role, index: true, null: false
      t.timestamps null: false
    end
  end
end
