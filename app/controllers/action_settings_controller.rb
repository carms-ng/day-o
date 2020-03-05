class ActionSettingsController < ApplicationController

  def update
    @setting = ActionSetting.find(params[:id])
    @setting.toggle_habit!
    if @setting.save
      redirect_to dashboard_path
    else
      render '/dashboard'
    end

  end
end
