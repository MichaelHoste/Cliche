class Api::SpotsController < Api::BaseController

  before_action :find_mission

  def index
    @spots = @mission.spots
  end

  private

  def find_mission
    @mission = Mission.enabled.find(params[:mission_id])
  end
end
