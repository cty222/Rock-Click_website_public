module GlobalTools 
  def redirect_to_target_page!(hash)
    hash.is_a?(Hash) || hash = {}
    @warning = hash[:warning]
    hash[:warning] = nil
    @notice = hash[:notice]
    hash[:notice] = nil
    @log = hash[:log]
    hash[:log] = nil
    @back_to_last_page = hash[:back]
    @url = hash[:url]
     
    # 如果 params 不為 nil 就會做    
    @warning && alert_warning(@warning)
    @notice && alert_notice(@notice)
    @log && assert_to_log!(@log)

    @action ||= "index"
    
    if @url
      redirect_to @url
    elsif @back_to_last_page
      redirect_to request.referer
    else
      redirect_to hash
    end
  end
  
  def respond_answer_by_json(answer, status)
    respond_to do |format|
      format.json {render json: {answer: answer, status: "ok"}}
    end
  end
  
  def assert_to_log!(error_code)
    if error_code.is_a? Hash
      folder = error_code[:folder]
      error_string = error_code[:error].to_s
    else
      error_string = error_code.to_s
    end
    folder ||= "rock_click"
    print_alert("#{self.class.name.to_s}, #{error_string}", folder.to_s)
  end
  
  def assert_to_error_handle_log!(error_code)
    folder ||= "error_handle"
    error_string = error_code.to_s 
    print_alert("#{error_string}", folder.to_s)
  end
  
  def print_alert(error_code, folder)
    @file_path ||= "#{Rails.root}/log/#{folder}/#{Time.now.strftime("%m_%d_%Y")}_#{folder}.log"
    if @logger.blank?
      dir = File.dirname(@file_path)
      FileUtils.mkdir_p(dir) unless File.directory?(dir)
      @logger = Logger.new(@file_path)
    end
    @logger.error(error_code.to_s)
  end
  
  def read_full_log(date, folder)
    @file_path = "#{Rails.root}/log/#{folder}/#{date}_#{folder}.log"
    data = File.read(@file_path) unless !File.file?(@file_path)
    return data.to_s
  end
end