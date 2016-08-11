class Admin::MissionsController < Admin::BaseController
  def index
    @missions = Mission.order(:name)
  end

  def new
    @mission = Mission.new
    render 'form'
  end

  def create
    @mission = Mission.new(strong_params)

    if @mission.save
      redirect_to admin_missions_path
    else
      set_flash_now_errors(@mission)
      render 'form'
    end
  end

  def edit
    @mission = Mission.find(params[:id])
    render 'form'
  end

  def update
    @mission = Mission.find(params[:id])

    if @mission.update_attributes(strong_params)
      redirect_to admin_missions_path
    else
      set_flash_now_errors(@mission)
      render 'form'
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy
    redirect_to admin_missions_path
  end

  private

  def strong_params
    params.require(:mission).permit(
      :name, :tagline, :description, :picture, :picture_cache, :latitude, :longitude, :enabled
    )
  end
end
