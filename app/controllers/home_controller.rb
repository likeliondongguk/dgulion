class HomeController < ApplicationController
  protect_from_forgery except: :imageUpload
  def index
  end
  def imageUpload
    file = params[:upload]
    uploader = SummernoteUploader.new
    uploader.store!(file)

    respond_to do |format|
      format.json { render :json => { url: uploader.url } }
    end
  end
end
