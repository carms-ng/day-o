class ChallengesController < ApplicationController

  def index
    # see if the user is searching something
    if params[:search].present?
      # displaying the challenges with the same name as the input
      @challenges = Challenge.where("lower(#{:name}) LIKE ?", "%#{params[:search].downcase}%")
    # see if the user is clicking on a category
    elsif params[:category_id].present?
      # find the category
      category = Category.find(params[:category_id])
      # find the challenge with that category
      @challenges = Challenge.joins(:challenge_categories).where(challenge_categories: { category_id: category.id })
      # @challenge = Challenge.joins(:challenge_categories).where(challenge_categories: { category_id: 1 })
    else
      all
    end

  end

  def all
    @challenges = Challenge.all
  end
end
