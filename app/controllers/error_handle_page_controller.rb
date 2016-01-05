class ErrorHandlePageController < ApplicationController
  def error_500
    
  end
  
  def error_404
    
  end
  
  def error_422
    
  end
  
  def error_monitor
    @date = params["date"]
    @date ||= Time.now.strftime("%m_%d_%Y")
    @error_log = read_full_log(@date, "error_handle")
  end
end
