class SummerimageController < ApplicationController
  protect_from_forgery except: :imageUpload

  def imageUpload
    file = params[:upload]
    uploader = SummernoteUploader.new
    uploader.store!(file)

    respond_to do |format|
      format.json { render :json => { url: uploader.url } }
    end
  end
end
