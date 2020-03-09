class BuddyChallengesController < ApplicationController
  def index
    @received = current_user.received_challenges
    @sent = current_user.sent_challenges
  end

  def create
    raise
  end
end
