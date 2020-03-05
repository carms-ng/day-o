class ActionSettingsController < ApplicationController

  def update
    @setting = ActionSetting.find(params[:id])
    @setting.toggle_habit!
    @setting.save
    redirect_to dashboard_path
  end

  def update_check
    @setting = ActionSetting.find(params[:id])
    @setting.toggle_checked!
    @setting.save
    redirect_to dashboard_path
  end
end


