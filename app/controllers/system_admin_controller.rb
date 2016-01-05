class SystemAdminController < ApplicationController
  before_action :system_admin_user_verify
  def show
    if menu_list.keys.include?(params[:main_menu].to_sym)
      main_menu = menu_list[params[:main_menu].to_sym]
      sub_menus = main_menu[:sub_menus]
      if sub_menus.keys.include?(params[:sub_menu].to_sym)
        @result = "成功"
      else
        # TODO:
        @result = "沒這頁2"  
      end
    else
      # TODO:
      @result = "沒這頁1"
    end
  end
  
  private
  def system_admin_user_verify
    if SystemAdminUser.find_by(user: current_user)
      
    else
      # TODO:
      @result = "沒有權限"
    end
  end
  
  def menu_list
    return {
      #文章編輯
      article: {
        name: "文章",
        sub_menus: {
          list: {
            name: "所有文章"
          },
        }
      },
      #其他...
    }
  end
end
