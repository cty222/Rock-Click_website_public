module RegularVerifyService
  def match_email_regexp?(string)  
    if string.nil?
      return false
    end  
    
    email = /\b[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b/
    if string.match(email)
      return true
    end
    return false
  end
end
