class AboutUsController < ApplicationController
  require "global/regular_verify_service"
  include RegularVerifyService
  
  def index
    @last_record = flash[:last_record] || {}
  end
  
  def email_contact
    @test = flash[:last_record] = params.permit(:email, :subject, :content)
    
    if !match_email_regexp?(params[:email])
      flash[:warning] = I18n.t("Email verify failed!!")
      redirect_to(action: :index)
      return
    elsif params[:subject].blank?
      flash[:warning] = I18n.t("Subject is empty!!")
      redirect_to(action: :index)
      return
    elsif params[:content].blank?
      flash[:warning] = I18n.t("Content is empty!!")
      redirect_to(action: :index)
      return
    end

    
    email = params[:email]
    subject = "#{email} send: #{params[:subject]}"
    content = "顧客意見留言: \n #{params[:content]}".gsub(/\n/, '<br>').gsub(' ', '&nbsp;')
    
    Thread.new do
      ContactMailer.customize(["traviscty@gmail.com"], subject, content).deliver
    end
    
    flash[:notice] = I18n.t("Sending successful")
    flash[:last_record] = nil
    redirect_to(action: :index)
  end
end
