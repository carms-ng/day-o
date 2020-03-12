class NotificationsController < ApplicationController
  def index
    render json: { count: current_user.notification_count }
  end
end
