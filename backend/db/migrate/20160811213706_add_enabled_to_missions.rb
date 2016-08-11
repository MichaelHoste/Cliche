class AddEnabledToMissions < ActiveRecord::Migration[5.0]
  def change
    add_column :missions, :enabled, :boolean, :default => false, :after => :longitude

    Mission.update_all(:enabled => true)
  end
end
