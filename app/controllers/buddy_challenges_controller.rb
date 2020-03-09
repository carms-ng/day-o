class BuddyChallengesController < ApplicationController
  def index
    @received = current_user.received_challenges
    @sent = current_user.sent_challenges
  end

  def create
    @buddy_challenge = BuddyChallenge.new(receiver_id: params[:buddy_challenge][:receiver_id], sender_id: current_user.id, challenge_id: params[:challenge_id], status: false)
    @buddy_challenge.save
    redirect_to buddy_challenges_path
  end
end
