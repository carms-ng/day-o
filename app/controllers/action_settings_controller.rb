class ActionSettingsController < ApplicationController

  def update
    @setting = ActionSetting.find(params[:id])
    @setting.toggle_habit!

    @setting.save
    if @setting.habit
      redirect_to dashboard_path
      flash[:notice] = "Great! It's added to your habits!"
    else
      redirect_to habit_path
    end
  end

  def update_check
    @setting = ActionSetting.find(params[:id])
    @setting.toggle_checked!
    @setting.save
    redirect_to habit_path
  end
end


