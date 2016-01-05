class MidiDrumController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:test5]
  
  def index
    @default_bpm = 120
    @bpm_max = 300
    @bpm_min = 30
  end
  
  def test5
    ajax_respond({ans:"123456789"})
  end

  def test
  end

  def ajax_respond(hash)
    respond_to do |format|
      format.json {render json: hash}
    end
  end
end
