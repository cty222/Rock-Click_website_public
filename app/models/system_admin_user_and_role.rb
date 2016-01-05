class SystemAdminUserAndRole < ActiveRecord::Base
   belongs_to :system_admin_user
   belongs_to :role
end
