class BuddyChallengesController < ApplicationController
  def index
    @received = current_user.received_challenges.where(status: false)
    @sent = current_user.sent_challenges
    @link_active = "Buddy"
    current_user.clear_notifications
  end

  def create
    receiver = User.find(params[:buddy_challenge][:receiver_id])
    receiver.give_notification
    @buddy_challenge = BuddyChallenge.new(receiver_id: params[:buddy_challenge][:receiver_id], sender_id: current_user.id, challenge_id: params[:challenge_id], status: false)
    @buddy_challenge.save
    redirect_to buddy_challenges_path
  end

  def update
    @buddy_challenge = BuddyChallenge.find(params[:id])
    @buddy_challenge.update(status: true)
    @buddy_challenge.sender_subscription = ChallengeSubscription.create(user: @buddy_challenge.sender, challenge: @buddy_challenge.challenge)
    @buddy_challenge.receiver_subscription = ChallengeSubscription.create(user: @buddy_challenge.receiver, challenge: @buddy_challenge.challenge)
    @buddy_challenge.save
    @buddy_challenge.sender.give_notification
    redirect_to dashboard_path
  end

  def destroy
    @buddy_challenge = BuddyChallenge.find(params[:id])
    @buddy_challenge.destroy
    respond_to do |format|
      format.html { render 'buddy_challenge/index' }
      format.js
    end
  end

end
