class ChallengesController < ApplicationController

  def index
    # see if the user is searching something
    if params[:search].present?
      @query = params[:search]
      # displaying the challenges with the same name as the input
      @challenges = Challenge.where("lower(#{:name}) LIKE ?", "%#{params[:search].downcase}%")
    # see if the user is clicking on a category
    elsif params[:category_id].present?
      # find the category
      @category = Category.find(params[:category_id])
      # find the actions whith that category
      # @actions = Action.joins(:action_categories).where(action_categories: { category_id: category.id })
      # @challenge = Challenge.joins(:challenge_categories).where(challenge_categories: { category_id: 1 })
      # find the challenge that has those actions
      @challenges = @category.actions.map do |action|
        action.challenge
      end.uniq
    else
      @challenges = Challenge.all
    end

  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
