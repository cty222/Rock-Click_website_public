class CreateSystemAdminUsers < ActiveRecord::Migration
  def change
    create_table :system_admin_users do |t|
      t.belongs_to :user, null: false
      t.timestamps null: false
    end
  end
end
