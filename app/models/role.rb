class Role < ActiveRecord::Base
  has_and_belongs_to_many :system_admin_users, class_name: 'SystemAdminUser', autosave: true, join_table: 'system_admin_user_and_roles'
  has_and_belongs_to_many :admin_functions, class_name: 'AdminFunction', autosave: true, join_table: 'role_and_admin_functions'
end
