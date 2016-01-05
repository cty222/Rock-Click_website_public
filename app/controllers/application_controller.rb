class ApplicationController < ActionController::Base
  require "global_tools"
  include GlobalTools
  
  class Langauge
    attr_accessor :name, :value
    def self.new(hash)
      return_value = super()
      return_value.name = hash[:name]
      return_value.value = hash[:value]
      return return_value
    end
  end
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :languege_assign
  before_action :access_conter
  
  def languege_assign
    @languages = [
      Langauge.new(name: "English", value: "en"),
      Langauge.new(name: "繁體中文", value: "zh_tw"),
      Langauge.new(name: "简体中文", value: "zh_cn"),
      Langauge.new(name: "日本語", value: "jp")
      ]
    
    @languege = params[:lang].blank? ? session[:lang] : params[:lang].to_s.downcase
    case @languege
    when "zh_tw" 
      I18n.locale = "zh_tw"
    when "zh_cn"
      I18n.locale = "zh_cn"
    when "jp"
      I18n.locale = "jp"
    else
      I18n.locale = "en"
      @languege = "en"
    end
    session[:lang] = @languege
    
  end
  
  def access_conter
    if params[:controller] == "error_handle_page" && params[:action] != "error_monitor"
      @counter = SystemRecord.find_by(name: "error_access_counter")
      @counter ||= SystemRecord.create(name: "error_access_counter", value: "0")
      @counter.value = (@counter.value.to_i + 1).to_s
      @counter.save 
      # Full env record
      #assert_to_error_handle_log!(request.env.to_s)
      assert_to_error_handle_log!("ip: #{request.remote_ip}, #{params.to_s}")
    else
      @counter = SystemRecord.find_by(name: "access_counter")
      @counter ||= SystemRecord.create(name: "access_counter", value: "0")
      @counter.value = (@counter.value.to_i + 1).to_s
      @counter.save 
    end
  end
end
