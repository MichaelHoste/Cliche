class Admin::SpotsController < Admin::BaseController

  before_action :find_mission

  def index
    @spots = @mission.spots.order(:name)
  end

  def new
    @spot = @mission.spots.new
    render 'form'
  end

  def create
    @spot = @mission.spots.new(strong_params)

    exif =  MiniMagick::Image.new(@spot.picture.path).exif
    lat_deg, lat_min, lat_sec = exif['GPSLatitude'].try(:split, ', ')
    lon_deg, lon_min, lon_sec = exif['GPSLongitude'].try(:split, ', ')

    #raise [compute(lat_deg), compute(lat_min), compute(lat_sec), compute(lon_deg), compute(lon_min), compute(lon_sec)].inspect

    if lat_deg
      lat_deg = compute(lat_deg)
      lat_min = compute(lat_min)
      lat_sec = compute(lat_sec)
      lon_deg = compute(lon_deg)
      lon_min = compute(lon_min)
      lon_sec = compute(lon_sec)

      @spot.latitude  = lat_deg+lat_min/60.0+lat_sec/3600.0
      @spot.longitude = lon_deg+lon_min/60.0+lon_sec/3600.0
    end

    if @spot.save
      redirect_to admin_mission_spots_path(@mission)
    else
      set_flash_now_errors(@spot)
      render 'form'
    end
  end

  def edit
    @spot = @mission.spots.find(params[:id])
    render 'form'
  end

  def update
    @spot = @mission.spots.find(params[:id])

    if @spot.update_attributes(strong_params)
      redirect_to admin_mission_spots_path(@mission)
    else
      set_flash_now_errors(@spot)
      render 'form'
    end
  end

  def destroy
    @spot = @mission.spots.find(params[:id])
    @spot.destroy
    redirect_to admin_mission_spots_path(@mission)
  end

  private

  def compute(value)
    value.split('/').first.to_f/value.split('/').last.to_f
  end

  def find_mission
    @mission = Mission.find(params[:mission_id])
  end

  def strong_params
    params.require(:spot).permit(
      :name, :description, :picture, :picture_cache, :latitude, :longitude
    )
  end
end
