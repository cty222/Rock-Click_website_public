class RoleAndAdminFunction < ActiveRecord::Base
   belongs_to :role
   belongs_to :admin_function
end
