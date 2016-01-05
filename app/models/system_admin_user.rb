class SystemAdminUser < ActiveRecord::Base
    has_and_belongs_to_many :roles, class_name: 'Role', autosave: true, join_table: 'system_admin_user_and_roles'
    belongs_to :user
end
