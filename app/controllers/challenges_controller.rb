class ChallengesController < ApplicationController

  def index
    category = Category.find(params[:category_id])
    @challenge = Challenge.joins(:challenge_categories).where(challenge_categories: { category_id: category.id })
    # @challenge = Challenge.joins(:challenge_categories).where(challenge_categories: { category_id: 1 })
  end

  def all
    @challenges = Challenge.all
  end
end
