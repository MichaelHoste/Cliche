class Api::MissionsController < Api::BaseController
  def index
    @missions = Mission.enabled
  end
end
