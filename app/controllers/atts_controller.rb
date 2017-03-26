class AttsController < ApplicationController
  before_action :set_sch

  def show

  end

  def update
    @atts.each do |att|
      att.update(att_params(att.id)[att.id.to_s])
    end
    redirect_to url_for(sch_atts_path(@sch))
  end

  private
  def set_sch

    @sch=Sch.find(params[:sch_id])
    @atts=Att.where(sch_id: @sch.id)
  end
#이거 여러 디비 받는 parameter
  def att_params(att_id)
    params.require(:atts).permit(att_id.to_s => :status)
  end
end
