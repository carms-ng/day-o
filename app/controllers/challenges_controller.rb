class ChallengesController < ApplicationController

  def index
    if params[:search].nil?
      Challenge.all
    else
      search
    end
  end

  private

  def search
    @keyword = params[:search]
    @services = Challenge.where("lower(#{:name}) LIKE ?", "%#{@keyword.downcase}%")
  end
end
