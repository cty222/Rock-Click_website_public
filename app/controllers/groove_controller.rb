class GrooveController < ApplicationController
  def index
    
  end
  
  def editer
    @user = User.first
    @grooves = @user.grooves
    @current_groove = @grooves.first
  end
  
  def load_groove
    respond_answer_by_json({name:"qqqqqqq" , test: "123456789"}, "ok")
  end
end
