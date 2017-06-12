class FacilitatorsController < ApplicationController
  before_action :set_facilitator, only: [:show, :edit, :update, :destroy]

  # GET /facilitators
  # GET /facilitators.json
  def index
    @institution = Institution.find(params[:institution_id])
    @coaching_activity = CoachingActivity.find(params[:coaching_activity_id])
    @facilitators = @coaching_activity.facilitators
  end

  # GET /facilitators/1
  # GET /facilitators/1.json
  def show
    @coaching_activity = CoachingActivity.find(params[:coaching_activity_id])
    @institution = Institution.find(params[:institution_id])
    @facilitator = Facilitator.find(params[:id])
  end

  # GET /facilitators/new
  def new
    @facilitator = Facilitator.new
    @coaching_activity = CoachingActivity.find(params[:coaching_activity_id])
    @institution = Institution.find(params[:institution_id])
  end

  # GET /facilitators/1/edit
  def edit
    @coaching_activity = CoachingActivity.find(params[:coaching_activity_id])
    @institution = Institution.find(params[:institution_id])
    @facilitator = Facilitator.find(params[:id])
  end

  # POST /facilitators
  # POST /facilitators.json
  def create
    @facilitator = Facilitator.new(facilitator_params)
    @institution = Institution.find(params[:institution_id])
    @coaching_activity = CoachingActivity.find(params[:coaching_activity_id])
    @facilitator.institution = Institution.find(params[:institution_id])
    @facilitator.coaching_activities << CoachingActivity.find(params[:coaching_activity_id])

    respond_to do |format|
      if @facilitator.save
        format.html { redirect_to institution_coaching_activity_facilitator_path(@institution, @coaching_activity, @facilitator), notice: 'Facilitator was successfully created.' }
        format.json { redirect_to institution_coaching_activity_facilitator_path(@institution, @coaching_activity, @facilitator, format: :json) }
      else
        format.html { render :new }
        format.json { render json: @facilitator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facilitators/1
  # PATCH/PUT /facilitators/1.json
  def update
    @coaching_activity = CoachingActivity.find(params[:coaching_activity_id])
    @institution = Institution.find(@coaching_activity.institution_id)
    respond_to do |format|
      if @facilitator.update(facilitator_params)
        format.html { redirect_to institution_coaching_activity_facilitator_path(@institution, @coaching_activity, @facilitator), notice: 'Facilitator was successfully updated.' }
        format.json { redirect_to institution_coaching_activity_facilitator_path(@institution, @coaching_activity, @facilitator, format: :json) }
      else
        format.html { render :edit }
        format.json { render json: @facilitator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facilitators/1
  # DELETE /facilitators/1.json
  def destroy
    @facilitator.destroy
    respond_to do |format|
      format.html { redirect_to institution_coaching_activity_facilitators_url, notice: 'Facilitator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facilitator
      @facilitator = Facilitator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facilitator_params
      params.require(:facilitator).permit(:name, :cpf, :institution_id, :coaching_activity_id)
    end
end
