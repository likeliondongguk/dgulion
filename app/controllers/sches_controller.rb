class SchesController < ApplicationController
  before_action :set_sch, only: [:show, :edit, :update, :destroy]

  # GET /sches
  # GET /sches.json
  def index
    @sches = Sch.all
  end

  # GET /sches/1
  # GET /sches/1.json
  def show
  end

  # GET /sches/new
  def new
    @sch = Sch.new
  end

  # GET /sches/1/edit
  def edit
  end

  # POST /sches
  # POST /sches.json
  def create
    @sch = Sch.new(sch_params)
    file= params[:image]
    uploader = ImageUploader.new
    uploader.store!(file)
    @sch.image=uploader.url
    respond_to do |format|
      if @sch.att_save
        format.html { redirect_to @sch, notice: 'Sch was successfully created.' }
        format.json { render :show, status: :created, location: @sch }
      else
        format.html { render :new }
        format.json { render json: @sch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sches/1
  # PATCH/PUT /sches/1.json
  def update
    respond_to do |format|
      if @sch.update(sch_params)
        format.html { redirect_to @sch, notice: 'Sch was successfully updated.' }
        format.json { render :show, status: :ok, location: @sch }
      else
        format.html { render :edit }
        format.json { render json: @sch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sches/1
  # DELETE /sches/1.json
  def destroy
    @sch.destroy
    respond_to do |format|
      format.html { redirect_to sches_url, notice: 'Sch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sch
      @sch = Sch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sch_params
      params.require(:sch).permit(:title, :date, :form, :content, :home_check)
    end
end
